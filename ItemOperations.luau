local ItemOperations = {}

type itemData = { [string] : string | number | boolean }
local itemClass = require(game.ServerScriptService.ParItems.ClassItem)

--Returns a table of objects with the given attribute
--location is folder name where we want to search, attValue optional
function ItemOperations.FindItemsByAttribute(location: Instance, attribute: string, attValue: any?): {Instance}
	task.desynchronize()
	local allItems = location:GetChildren()
	local needle = {}

	for index, value in ipairs(allItems) do
		if value:GetAttribute(attribute) ~= nil and attValue == nil then
			table.insert(needle, value)
		elseif attValue ~= nil then
			if value:GetAttribute(attribute) == attValue then
				table.insert(needle, value)
			end
		end
	end
	
	task.synchronize()
	return needle
end

--Takes an itemData dictionary and returns an itemString with only the dynamic data recorded
function ItemOperations.CreateItemStringFromItemData(itemData: itemData): string
	task.desynchronize()
	local iTypesTable = itemClass:GetAllItemTypes()
	local shortItemType = ""
	
	--Get short itemType from long itemType
	for key, value in pairs(iTypesTable) do
		if key == itemData.itemType then
			shortItemType = value
			break
		end
	end
	
	local itemString = `ID:{itemData.itemID},IT:{shortItemType},IR:{itemData.itemRarity}` --attributes that will be in all item definitions
	
	if itemData.itemEquipped ~= -1 then --If the item is currently equipped, save the slot
		itemString ..= ",IE:" .. itemData.itemEquipped
	end
	
	if itemData.itemRarity == 8 then --Check if rarity is unique. If so, save the name
		itemString ..= ",IN:" .. itemData.itemName
	end
	
	--[[Save dynamic attributes if they exist
		Max - Min = CurrentRange
    	Roll - Min = Normal
   		Normal / CurrentRange = Percent   -> save Percent to DB as a fraction
	]]
	if string.len(itemData.attributesToSave) > 0 then
		local attributesToSave = string.split(itemData.attributesToSave, ",")
		local category = itemClass.GetItemTypeCategory(itemData.itemType)
		
		for i, attribute in attributesToSave do
			local min, max, range, normal: number
			
			min = itemClass[category][itemData.itemType][attribute][itemData.itemRarity]["minValue"]
			max = itemClass[category][itemData.itemType][attribute][itemData.itemRarity]["maxValue"]
			range = max - min
			normal = itemData[attribute] - min
			
			itemString ..= `,{attribute}:{normal}/{range}`
		end
	end
	
	task.synchronize()
	return itemString
end

--Takes an itemString -- the format of items that are saved in datastore -- and constructs an itemData from it. Returns itemData
function ItemOperations.CreateItemDataFromItemString(itemString: string): itemData
	task.desynchronize()
	local itemData = {}
	local matchPrefixes ={"ID:","IT:","IR:","IE:","IN:"}
	local itemStringArray = string.split(itemString, ",")
	
	local function findStringWithPrefix(prefix: string): string
		for index, str in itemStringArray do
			local iStart, iEnd = string.find(str, `^{prefix}`)
			if iStart ~= nil then
				table.remove(itemStringArray, index) --Remove the values from the array as we retrieve them so that we have only dynamic attributes left over after the for loop.
				return string.match(str, ".+", iEnd + 1)
			end
		end
	end
	
	for _, cat in pairs(itemClass.Category) do --Loops through each itemClass category (e.g. WeaponType, ArmorType)
		local found = false
		local shortType = findStringWithPrefix(matchPrefixes[2])
		
		for iType, v in pairs(itemClass[cat]) do --Loops through each item definition in the category
			if itemClass[cat][iType]["itemType"] == shortType then
				for key, value in pairs(itemClass[cat][iType]) do --Loops through each attribute in the correct definition, adding them to itemData table
					if typeof(value) == "table" then --Skips if attribute is randomized
						continue
					elseif key == "itemType" then --make itemType = longType instead of shortType
						itemData[key] = iType
					else
						itemData[key] = value
					end
				end
				
				--Change attributes to data we saved in the itemString
				itemData.itemRarity = findStringWithPrefix(matchPrefixes[3])
				itemData.itemID = findStringWithPrefix(matchPrefixes[1])
				
				if itemData.itemRarity == 8 then
					itemData.itemName = findStringWithPrefix(matchPrefixes[5])
				end
				
				local EquippedSlot = findStringWithPrefix(matchPrefixes[4])
				if EquippedSlot then --Check if itemEquipped was saved
					itemData.itemEquipped = EquippedSlot
				else
					itemData.itemEquipped = -1
				end
				
				found = true
				break
			end
		end
		
		if found then
			break
		end
	end
	
	--[[Loads dynamic attributes if they exist. All leftover elements in itemStringArray should now be dynamic attributes.
	Normal / OldRange = Percent
	Max - Min = CurrentRange
    (Percent * CurrentRange) + Min = Roll
	]]
	if #itemStringArray > 0 then
		local attributesToSave = ""
		local category = itemClass:GetItemTypeCategory(itemData.itemType)
		for index, str in itemStringArray do
			local attribute, normal, oldRange = string.match(str, "(%w+):(%d+)/(%d+)")
			
			if oldRange == 0 then
				oldRange = 1
			end
			
			local percent = normal / oldRange
			local max = itemClass[category][itemData.itemType][attribute][itemData.itemRarity]["maxValue"]
			local min = itemClass[category][itemData.itemType][attribute][itemData.itemRarity]["minValue"]
			local currentRange = max - min
			
			itemData[attribute] = (percent * currentRange) + min
			
			if string.len(attributesToSave) == 0 then
				attributesToSave = attribute
			else
				attributesToSave ..= `,{attribute}`
			end
		end
		itemData["attributesToSave"] = attributesToSave
	end
	
	task.synchronize()
	return itemData	
end

function ItemOperations.GetItemObjectItemData(item: Instance): itemData
	return item:GetAttributes()
end

return ItemOperations
