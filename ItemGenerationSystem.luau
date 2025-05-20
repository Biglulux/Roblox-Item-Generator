local ItemGenerationSystem = {}

type itemData = { [string]: string | number | boolean }
local itemClass = require(game.ServerScriptService.ParItems.ClassItem)
local random = Random.new()

ItemGenerationSystem.__index = ItemGenerationSystem

--@return new ItemGenerationSystem
function ItemGenerationSystem:new()
	local obj = {}
	setmetatable(obj, self)
	
	--Luau ALWAYS passes tables by reference. In order to actually make the instance have independant values, we must explicitly clone the values.
	for k, v in self do
		if typeof(self[k]) == "table" then
			obj[k] = table.clone(self[k])
		else
			obj[k] = self[k]
		end
	end
	
	return obj
end

--Create new PercentageChanceItems and PercentageChanceRarity from existing item types and rarities in ClassItems, set with default values
--Must be ran at least once before calling GenerateContainerLoot()
--@param iTypesToExclude : {string}? -> table of item types to exclude from the generation system
function ItemGenerationSystem:InitDefault(iTypesToExclude: {string}?)
	task.desynchronize()
	self.PercentageChanceItems = {}
	self.PercentageChanceRarity = {}
	local iTypes = itemClass:GetAllItemTypes()
	
	if iTypesToExclude == nil then
		iTypesToExclude = {}
		table.insert(iTypesToExclude, "SoulHeart") --We probably never want to drop a soul heart from a container
	end

	--Remove unwanted item types from the drop table
	for i = 1, #iTypesToExclude do
		iTypes[iTypesToExclude[i]] = nil
	end
	
	--Create a dictionary under PercentageChanceItems with [string] : number, where number is the weighted relative chance of an item.
	for key, value in pairs(iTypes) do
		self.PercentageChanceItems[key] = 50
	end
	
	--Set chances for Rarity
	self.PercentageChanceRarity.Junk = 5
	self.PercentageChanceRarity.Poor = 15
	self.PercentageChanceRarity.Common = 40
	self.PercentageChanceRarity.Uncommon = 22
	self.PercentageChanceRarity.Rare = 10
	self.PercentageChanceRarity.Epic = 5
	self.PercentageChanceRarity.Legendary = 2
	self.PercentageChanceRarity.Unique = 1
	
	task.synchronize()
end

--@param items : {[string] : number} ->  where number is the weight of the key to be selected
--@return name : string -> returns the string of the key selected
local function weightedRandomChoice(items): string
	local totalWeight = 0
	for _, weight in pairs(items) do
		totalWeight = totalWeight + weight
	end
	
	local randomNum = random:NextNumber(0, totalWeight + 1e-6)
	local accumulatedWeight = 0

	for name, weight in pairs(items) do
		accumulatedWeight = accumulatedWeight + weight
		if accumulatedWeight >= randomNum then
			return name
		end
	end
end

--@param budget : number -> bigger budget = more or rarer items
--@return generatedItems : {Instance} -> array of item objects (not itemData)
function ItemGenerationSystem:GenerateContainerLoot(budget: number): {Instance}
	task.desynchronize()
	local generatedItems = {}
	local repeatCounter = 0
	
	repeat
		if budget < 100 and repeatCounter >= 100 then
			break
		end
		
		local itemType = weightedRandomChoice(self.PercentageChanceItems)
		local rarity = weightedRandomChoice(self.PercentageChanceRarity)
		
		rarity = itemClass.Rarity[rarity]
		local itemBudgetValue = itemClass:GetItemTypeBudgetValue(itemType) * rarity
		
		if budget - itemBudgetValue < 0 then
			repeatCounter += 1
			continue
		end
		
		budget -= itemBudgetValue
		table.insert(generatedItems, itemClass:new(itemType, rarity))
	until budget == 0
	
	task.synchronize()
	--Convert itemData to item objects and put them in the global item cache
	local generatedItemObjects = {}
	
	for index, value in generatedItems do
		table.insert(generatedItemObjects, self.CloneItemToStorage(value, game.ServerStorage.GlobalItemCache))
	end
	
	return generatedItemObjects
end

--@param itemData : itemData
--@param location : Instance -> parent
--@return itemObject : Instance -> cloned item
function ItemGenerationSystem.CloneItemToStorage(itemData: itemData, location: Instance): Instance
	local itemObject = game.ServerStorage.DefaultItems:FindFirstChild(itemData.itemType, true):Clone()
	
	for key, value in pairs(itemData) do
		itemObject:SetAttribute(key, value)
	end
	
	
	itemObject.Parent = location
	return itemObject
end

--Permanently removes the item from the game by removing it from the global item cache in addition to a specified location.
--If need to remove item from just a specific place, do not use this.
--@param itemID : string
--@param location : Instance -> where to search for the item
function ItemGenerationSystem.PermanentlyDestroyItem(itemID: string, location: Instance)
	local itemObject = require(game.ServerScriptService.ParItems.ItemOperations).FindItemsByAttribute(location, "itemID", itemID)
	itemObject = table.unpack(itemObject)
	
	if location ~= game.ServerStorage.GlobalItemCache then
		local cacheItem = require(game.ServerScriptService.ParItems.ItemOperations).FindItemsByAttribute(game.ServerStorage.GlobalItemCache, "itemID", itemID)
		cacheItem = table.unpack(cacheItem)
		cacheItem:Destroy()
	end
	
	itemObject:Destroy()
end

--@param itemID : string
--@param location : Vector3 -> the physical location to spawn the item in Workspace
--@param parent : Instance
--@return itemObject : Instance
function ItemGenerationSystem.SpawnItemFromItemID(itemID: string, location: Vector3, parent: Instance): Instance
	local itemObject = require(game.ServerScriptService.ParItems.ItemOperations).FindItemsByAttribute(game.ServerStorage.GlobalItemCache, "itemID", itemID)
	itemObject = table.unpack(itemObject)
	
	itemObject = itemObject:Clone()
	itemObject.Handle.Position = location
	itemObject.Parent = parent
	
	return itemObject
end

--@param itemObject : Instance
--@param location : Vector3 -> the physical location to spawn the item in Workspace
--@param parent : Instance
--@return itemObject : Instance
function ItemGenerationSystem.SpawnItemFromInstance(itemObject: Instance, location: Vector3, parent: Instance): Instance
	itemObject = itemObject:Clone()
	itemObject.Handle.Position = location
	itemObject.Parent = parent

	return itemObject
end

return ItemGenerationSystem
