local ClassItem = {}

--THESE DEFINITIONS ARE READ ONLY! DO NOT CHANGE VALUES AT RUNTIME!

ClassItem.Rarity =
	{
		Junk = 1,
		Poor = 2,
		Common = 3,
		Uncommon = 4,
		Rare = 5,
		Epic = 6,
		Legendary = 7,
		Unique = 8
	}

ClassItem.EquipSlot = 
	{
		MainHand = 1,
		OffHand = 2,
		TwoHanded = 3,
		Util1 = 4, --util 1 and 2 are interchangable; do an or check when actually equipping
		Util2 = 5,
		Head = 6,
		Chest = 7,
		Hands = 8,
		Legs = 9,
		Feet = 10,
		Back = 11,
		Pendant = 12,
		Ring = 13
	}

ClassItem.Category =
	{
		WeaponType = "WeaponType",
		ArmorType = "ArmorType",
		JewleryType = "JewleryType",
		ConsumableType = "ConsumableType",
		LootableType = "LootableType",
		ToolType = "ToolType"
	}

ClassItem.WeaponType = 
	{
		Shortsword = 
		{
			itemID = "",
			itemType = "SS",
			itemName = "Shortsword",
			itemBudgetValue = 100, --base value used in the container budget system
			itemMoneyValue = 0, --base value for player selling to vendor for money
			itemDescription = "A short blade.",
			itemEquipSlot = ClassItem.EquipSlot.OneHanded, --slot: one handed, two handed, chest, boots, etc. If nil, not equippable.
			itemEquipped = -1, --What slot the item is currently equipped in. If -1, not equipped.
			itemMovementSpeed = -10, --movement speed increase or decrease when wielded
			itemActionTime = 0.73, --time to complete the item's action (attack, drink, etc) when used
			itemActionMovementSpeed = -0.09, --percentage that movement speed is changed while using the item (here movement speed decreased by 9% while swinging)
			itemDamage = --Should be treated as a component, not shove all effects into one variable. itemDamage = damage component, itemHealing = healing, etc.
			{
				{
					itemRarity = ClassItem.Rarity.Junk,
					minValue = 15, --range that the stat can generate between in this rarity
					maxValue = 17 --minValue and maxValue must be defined for every rarity, so if want to have only one possible number then make both the same
				},
				{
					itemRarity = ClassItem.Rarity.Poor,
					minValue = 18,
					maxValue = 19
				},
				{
					itemRarity = ClassItem.Rarity.Common,
					minValue = 20,
					maxValue = 22
				},
				{
					itemRarity = ClassItem.Rarity.Uncommon,
					minValue = 22,
					maxValue = 24
				},
				{
					itemRarity = ClassItem.Rarity.Rare,
					minValue = 24,
					maxValue = 27
				},
				{
					itemRarity = ClassItem.Rarity.Epic,
					minValue = 27,
					maxValue = 30
				},
				{
					itemRarity = ClassItem.Rarity.Legendary,
					minValue = 30,
					maxValue = 33
				},
				{
					itemRarity = ClassItem.Rarity.Unique,
					minValue = 33,
					maxValue = 35
				}
			},
		},
		Longsword = 
		{
			itemID = "",
			itemType = "LS",
			itemName = "Longsword",
			itemBudgetValue = 100,
			itemMoneyValue = 0,
			itemDescription = "A very long blade.",
			itemEquipSlot = ClassItem.EquipSlot.TwoHanded,
			itemEquipped = -1,
			itemMovementSpeed = -40,
			itemActionTime = 1.22,
			itemActionMovementSpeed = -0.35,
			itemDamage =
			{
				{
					itemRarity = ClassItem.Rarity.Junk,
					minValue = 29,
					maxValue = 32
				},
				{
					itemRarity = ClassItem.Rarity.Poor,
					minValue = 33,
					maxValue = 34
				},
				{
					itemRarity = ClassItem.Rarity.Common,
					minValue = 35,
					maxValue = 38
				},
				{
					itemRarity = ClassItem.Rarity.Uncommon,
					minValue = 38,
					maxValue = 41
				},
				{
					itemRarity = ClassItem.Rarity.Rare,
					minValue = 41,
					maxValue = 45
				},
				{
					itemRarity = ClassItem.Rarity.Epic,
					minValue = 45,
					maxValue = 49
				},
				{
					itemRarity = ClassItem.Rarity.Legendary,
					minValue = 49,
					maxValue = 52
				},
				{
					itemRarity = ClassItem.Rarity.Unique,
					minValue = 52,
					maxValue = 54
				}
			},
		},
		MorningstarMace = 
		{
			itemID = "",
			itemType = "MM",
			itemName = "Morningstar Mace",
			itemBudgetValue = 100,
			itemMoneyValue = 0,
			itemDescription = "A heavy, blunt mace.",
			itemEquipSlot = ClassItem.EquipSlot.OneHanded,
			itemEquipped = -1,
			itemMovementSpeed = -25,
			itemActionTime = 0.96,
			itemActionMovementSpeed = -0.3,
			itemDamage =
			{
				{
					itemRarity = ClassItem.Rarity.Junk,
					minValue = 28,
					maxValue = 31
				},
				{
					itemRarity = ClassItem.Rarity.Poor,
					minValue = 32,
					maxValue = 33
				},
				{
					itemRarity = ClassItem.Rarity.Common,
					minValue = 34,
					maxValue = 37
				},
				{
					itemRarity = ClassItem.Rarity.Uncommon,
					minValue = 37,
					maxValue = 40
				},
				{
					itemRarity = ClassItem.Rarity.Rare,
					minValue = 40,
					maxValue = 44
				},
				{
					itemRarity = ClassItem.Rarity.Epic,
					minValue = 44,
					maxValue = 48
				},
				{
					itemRarity = ClassItem.Rarity.Legendary,
					minValue = 48,
					maxValue = 51
				},
				{
					itemRarity = ClassItem.Rarity.Unique,
					minValue = 51,
					maxValue = 53
				}
			},
		},
		WarMaul = 
		{
			itemID = "",
			itemType = "WM",
			itemName = "War Maul",
			itemBudgetValue = 100,
			itemMoneyValue = 0,
			itemDescription = "A heavy, blunt hammer.",
			itemEquipSlot = ClassItem.EquipSlot.TwoHanded,
			itemEquipped = -1,
			itemMovementSpeed = -55,
			itemActionTime = 1.39,
			itemActionMovementSpeed = -0.4,
			itemDamage =
			{
				{
					itemRarity = ClassItem.Rarity.Junk,
					minValue = 45,
					maxValue = 48
				},
				{
					itemRarity = ClassItem.Rarity.Poor,
					minValue = 49,
					maxValue = 52
				},
				{
					itemRarity = ClassItem.Rarity.Common,
					minValue = 53,
					maxValue = 58
				},
				{
					itemRarity = ClassItem.Rarity.Uncommon,
					minValue = 58,
					maxValue = 63
				},
				{
					itemRarity = ClassItem.Rarity.Rare,
					minValue = 63,
					maxValue = 69
				},
				{
					itemRarity = ClassItem.Rarity.Epic,
					minValue = 69,
					maxValue = 75
				},
				{
					itemRarity = ClassItem.Rarity.Legendary,
					minValue = 75,
					maxValue = 79
				},
				{
					itemRarity = ClassItem.Rarity.Unique,
					minValue = 79,
					maxValue = 82
				}
			},
		},
		Dagger = 
		{
			itemID = "",
			itemType = "DA",
			itemName = "Dagger",
			itemBudgetValue = 100,
			itemMoneyValue = 0,
			itemDescription = "A fast, light weapon.",
			itemEquipSlot = ClassItem.EquipSlot.OneHanded,
			itemEquipped = -1,
			itemMovementSpeed = -10,
			itemActionTime = 0.59,
			itemActionMovementSpeed = -0.15,
			itemDamage =
			{
				{
					itemRarity = ClassItem.Rarity.Junk,
					minValue = 15,
					maxValue = 17
				},
				{
					itemRarity = ClassItem.Rarity.Poor,
					minValue = 18,
					maxValue = 19
				},
				{
					itemRarity = ClassItem.Rarity.Common,
					minValue = 20,
					maxValue = 22
				},
				{
					itemRarity = ClassItem.Rarity.Uncommon,
					minValue = 22,
					maxValue = 24
				},
				{
					itemRarity = ClassItem.Rarity.Rare,
					minValue = 24,
					maxValue = 27
				},
				{
					itemRarity = ClassItem.Rarity.Epic,
					minValue = 27,
					maxValue = 30
				},
				{
					itemRarity = ClassItem.Rarity.Legendary,
					minValue = 30,
					maxValue = 33
				},
				{
					itemRarity = ClassItem.Rarity.Unique,
					minValue = 33,
					maxValue = 35
				}
			},
		},
		Halberd = 
		{
			itemID = "",
			itemType = "HA",
			itemName = "Halberd",
			itemBudgetValue = 100,
			itemMoneyValue = 0,
			itemDescription = "A long reaching axe weapon.",
			itemEquipSlot = ClassItem.EquipSlot.TwoHanded,
			itemEquipped = -1,
			itemMovementSpeed = -50,
			itemActionTime = 1.13,
			itemActionMovementSpeed = -0.3,
			itemDamage =
			{
				{
					itemRarity = ClassItem.Rarity.Junk,
					minValue = 37,
					maxValue = 40
				},
				{
					itemRarity = ClassItem.Rarity.Poor,
					minValue = 41,
					maxValue = 43
				},
				{
					itemRarity = ClassItem.Rarity.Common,
					minValue = 44,
					maxValue = 48
				},
				{
					itemRarity = ClassItem.Rarity.Uncommon,
					minValue = 48,
					maxValue = 52
				},
				{
					itemRarity = ClassItem.Rarity.Rare,
					minValue = 52,
					maxValue = 57
				},
				{
					itemRarity = ClassItem.Rarity.Epic,
					minValue = 57,
					maxValue = 62
				},
				{
					itemRarity = ClassItem.Rarity.Legendary,
					minValue = 62,
					maxValue = 66
				},
				{
					itemRarity = ClassItem.Rarity.Unique,
					minValue = 66,
					maxValue = 69
				}
			},
		},
		Spear = 
		{
			itemID = "",
			itemType = "SP",
			itemName = "Spear",
			itemBudgetValue = 100,
			itemMoneyValue = 0,
			itemDescription = "A long reaching pointy tipped weapon.",
			itemEquipSlot = ClassItem.EquipSlot.TwoHanded,
			itemEquipped = -1,
			itemMovementSpeed = -40,
			itemActionTime = 0.86,
			itemActionMovementSpeed = -0.25,
			itemDamage =
			{
				{
					itemRarity = ClassItem.Rarity.Junk,
					minValue = 29,
					maxValue = 32
				},
				{
					itemRarity = ClassItem.Rarity.Poor,
					minValue = 33,
					maxValue = 34
				},
				{
					itemRarity = ClassItem.Rarity.Common,
					minValue = 35,
					maxValue = 38
				},
				{
					itemRarity = ClassItem.Rarity.Uncommon,
					minValue = 38,
					maxValue = 41
				},
				{
					itemRarity = ClassItem.Rarity.Rare,
					minValue = 41,
					maxValue = 45
				},
				{
					itemRarity = ClassItem.Rarity.Epic,
					minValue = 45,
					maxValue = 49
				},
				{
					itemRarity = ClassItem.Rarity.Legendary,
					minValue = 49,
					maxValue = 52
				},
				{
					itemRarity = ClassItem.Rarity.Unique,
					minValue = 52,
					maxValue = 54
				}
			},
		},
		FellingAxe = 
		{
			itemID = "",
			itemType = "FA",
			itemName = "Felling Axe",
			itemBudgetValue = 100,
			itemMoneyValue = 0,
			itemDescription = "A heavy chopping weapon for devastating close combat.",
			itemEquipSlot = ClassItem.EquipSlot.TwoHanded,
			itemEquipped = -1,
			itemMovementSpeed = -40,
			itemActionTime = 0.92,
			itemActionMovementSpeed = -0.3,
			itemDamage =
			{
				{
					itemRarity = ClassItem.Rarity.Junk,
					minValue = 33,
					maxValue = 36
				},
				{
					itemRarity = ClassItem.Rarity.Poor,
					minValue = 37,
					maxValue = 39
				},
				{
					itemRarity = ClassItem.Rarity.Common,
					minValue = 40,
					maxValue = 44
				},
				{
					itemRarity = ClassItem.Rarity.Uncommon,
					minValue = 44,
					maxValue = 48
				},
				{
					itemRarity = ClassItem.Rarity.Rare,
					minValue = 48,
					maxValue = 53
				},
				{
					itemRarity = ClassItem.Rarity.Epic,
					minValue = 53,
					maxValue = 58
				},
				{
					itemRarity = ClassItem.Rarity.Legendary,
					minValue = 58,
					maxValue = 62
				},
				{
					itemRarity = ClassItem.Rarity.Unique,
					minValue = 62,
					maxValue = 65
				}
			},
		},
		Hatchet = 
		{
			itemID = "",
			itemType = "HT",
			itemName = "Hatchet",
			itemBudgetValue = 100,
			itemMoneyValue = 0,
			itemDescription = "A hatchet for cutting wood.",
			itemEquipSlot = ClassItem.EquipSlot.OneHanded,
			itemEquipped = -1,
			itemMovementSpeed = -25,
			itemActionTime = 0.74,
			itemActionMovementSpeed = -0.17,
			itemDamage =
			{
				{
					itemRarity = ClassItem.Rarity.Junk,
					minValue = 15,
					maxValue = 17
				},
				{
					itemRarity = ClassItem.Rarity.Poor,
					minValue = 18,
					maxValue = 19
				},
				{
					itemRarity = ClassItem.Rarity.Common,
					minValue = 20,
					maxValue = 22
				},
				{
					itemRarity = ClassItem.Rarity.Uncommon,
					minValue = 22,
					maxValue = 24
				},
				{
					itemRarity = ClassItem.Rarity.Rare,
					minValue = 24,
					maxValue = 27
				},
				{
					itemRarity = ClassItem.Rarity.Epic,
					minValue = 27,
					maxValue = 30
				},
				{
					itemRarity = ClassItem.Rarity.Legendary,
					minValue = 30,
					maxValue = 33
				},
				{
					itemRarity = ClassItem.Rarity.Unique,
					minValue = 33,
					maxValue = 35
				}
			},
		},
		Longbow = 
		{
			itemID = "",
			itemType = "LB",
			itemName = "Longbow",
			itemBudgetValue = 100,
			itemMoneyValue = 0,
			itemDescription = "A ranged weapon for long distance combat.",
			itemEquipSlot = ClassItem.EquipSlot.TwoHanded,
			itemEquipped = -1,
			itemMovementSpeed = -50,
			itemActionTime = 2.03,
			itemActionMovementSpeed = -0.44,
			itemAmmo = 5,
			itemReloadTime = 2.98,
			itemReloadMovementSpeed = -0.60, --percentage movement slowed while reloading
			itemDamage =
			{
				{
					itemRarity = ClassItem.Rarity.Junk,
					minValue = 30,
					maxValue = 33
				},
				{
					itemRarity = ClassItem.Rarity.Poor,
					minValue = 34,
					maxValue = 36
				},
				{
					itemRarity = ClassItem.Rarity.Common,
					minValue = 37,
					maxValue = 41
				},
				{
					itemRarity = ClassItem.Rarity.Uncommon,
					minValue = 41,
					maxValue = 45
				},
				{
					itemRarity = ClassItem.Rarity.Rare,
					minValue = 45,
					maxValue = 50
				},
				{
					itemRarity = ClassItem.Rarity.Epic,
					minValue = 50,
					maxValue = 55
				},
				{
					itemRarity = ClassItem.Rarity.Legendary,
					minValue = 55,
					maxValue = 59
				},
				{
					itemRarity = ClassItem.Rarity.Unique,
					minValue = 59,
					maxValue = 62
				}
			},
		},
		RecurveBow = 
		{
			itemID = "",
			itemType = "RB",
			itemName = "Recurve Bow",
			itemBudgetValue = 100,
			itemMoneyValue = 0,
			itemDescription = "A ranged weapon for long distance combat.",
			itemEquipSlot = ClassItem.EquipSlot.TwoHanded,
			itemEquipped = -1,
			itemMovementSpeed = -40,
			itemActionTime = 1.3,
			itemActionMovementSpeed = -0.35,
			itemAmmo = 6,
			itemReloadTime = 2.98,
			itemReloadMovementSpeed = -0.50,
			itemDamage =
			{
				{
					itemRarity = ClassItem.Rarity.Junk,
					minValue = 24,
					maxValue = 27
				},
				{
					itemRarity = ClassItem.Rarity.Poor,
					minValue = 28,
					maxValue = 29
				},
				{
					itemRarity = ClassItem.Rarity.Common,
					minValue = 30,
					maxValue = 33
				},
				{
					itemRarity = ClassItem.Rarity.Uncommon,
					minValue = 33,
					maxValue = 36
				},
				{
					itemRarity = ClassItem.Rarity.Rare,
					minValue = 36,
					maxValue = 40
				},
				{
					itemRarity = ClassItem.Rarity.Epic,
					minValue = 40,
					maxValue = 44
				},
				{
					itemRarity = ClassItem.Rarity.Legendary,
					minValue = 44,
					maxValue = 47
				},
				{
					itemRarity = ClassItem.Rarity.Unique,
					minValue = 47,
					maxValue = 49
				}
			},
		},
		SurvivalBow = 
		{
			itemID = "",
			itemType = "SB",
			itemName = "Survival Bow",
			itemBudgetValue = 100,
			itemMoneyValue = 0,
			itemDescription = "A ranged weapon for long distance combat.",
			itemEquipSlot = ClassItem.EquipSlot.TwoHanded,
			itemEquipped = -1,
			itemMovementSpeed = -30,
			itemActionTime = 1.23,
			itemActionMovementSpeed = -0.25,
			itemAmmo = 7,
			itemReloadTime = 2.98,
			itemReloadMovementSpeed = -0.40,
			itemDamage =
			{
				{
					itemRarity = ClassItem.Rarity.Junk,
					minValue = 13,
					maxValue = 13
				},
				{
					itemRarity = ClassItem.Rarity.Poor,
					minValue = 14,
					maxValue = 15
				},
				{
					itemRarity = ClassItem.Rarity.Common,
					minValue = 16,
					maxValue = 18
				},
				{
					itemRarity = ClassItem.Rarity.Uncommon,
					minValue = 18,
					maxValue = 20
				},
				{
					itemRarity = ClassItem.Rarity.Rare,
					minValue = 20,
					maxValue = 22
				},
				{
					itemRarity = ClassItem.Rarity.Epic,
					minValue = 22,
					maxValue = 24
				},
				{
					itemRarity = ClassItem.Rarity.Legendary,
					minValue = 24,
					maxValue = 26
				},
				{
					itemRarity = ClassItem.Rarity.Unique,
					minValue = 26,
					maxValue = 27
				}
			},
		},
		Crossbow = 
		{
			itemID = "",
			itemType = "CB",
			itemName = "Crossbow",
			itemBudgetValue = 100,
			itemMoneyValue = 0,
			itemDescription = "A ranged weapon for long distance combat.",
			itemEquipSlot = ClassItem.EquipSlot.TwoHanded,
			itemEquipped = -1,
			itemMovementSpeed = -50,
			itemActionTime = 0,
			itemActionMovementSpeed = -0.44,
			itemAmmo = 1,
			itemReloadTime = 3.47,
			itemReloadMovementSpeed = -1,
			itemDamage =
			{
				{
					itemRarity = ClassItem.Rarity.Junk,
					minValue = 39,
					maxValue = 42
				},
				{
					itemRarity = ClassItem.Rarity.Poor,
					minValue = 43,
					maxValue = 45
				},
				{
					itemRarity = ClassItem.Rarity.Common,
					minValue = 46,
					maxValue = 50
				},
				{
					itemRarity = ClassItem.Rarity.Uncommon,
					minValue = 50,
					maxValue = 54
				},
				{
					itemRarity = ClassItem.Rarity.Rare,
					minValue = 54,
					maxValue = 59
				},
				{
					itemRarity = ClassItem.Rarity.Epic,
					minValue = 59,
					maxValue = 64
				},
				{
					itemRarity = ClassItem.Rarity.Legendary,
					minValue = 64,
					maxValue = 68
				},
				{
					itemRarity = ClassItem.Rarity.Unique,
					minValue = 68,
					maxValue = 71
				}
			},
		},
		WizardStaff = 
		{
			itemID = "",
			itemType = "WS",
			itemName = "Wizard Staff",
			itemBudgetValue = 100,
			itemMoneyValue = 0,
			itemDescription = "A staff for casting spells.",
			itemEquipSlot = ClassItem.EquipSlot.TwoHanded,
			itemEquipped = -1,
			itemMovementSpeed = -20,
			itemActionTime = 0.69,
			itemActionMovementSpeed = -0.30,
			itemDamage =
			{
				{
					itemRarity = ClassItem.Rarity.Junk,
					minValue = 19,
					maxValue = 21
				},
				{
					itemRarity = ClassItem.Rarity.Poor,
					minValue = 22,
					maxValue = 23
				},
				{
					itemRarity = ClassItem.Rarity.Common,
					minValue = 24,
					maxValue = 26
				},
				{
					itemRarity = ClassItem.Rarity.Uncommon,
					minValue = 26,
					maxValue = 28
				},
				{
					itemRarity = ClassItem.Rarity.Rare,
					minValue = 28,
					maxValue = 31
				},
				{
					itemRarity = ClassItem.Rarity.Epic,
					minValue = 31,
					maxValue = 34
				},
				{
					itemRarity = ClassItem.Rarity.Legendary,
					minValue = 34,
					maxValue = 37
				},
				{
					itemRarity = ClassItem.Rarity.Unique,
					minValue = 37,
					maxValue = 39
				}
			},
		},
		HealingStaff = 
		{
			itemID = "",
			itemType = "HS",
			itemName = "Healing Staff",
			itemBudgetValue = 100,
			itemMoneyValue = 0,
			itemDescription = "A staff for casting spells.",
			itemEquipSlot = ClassItem.EquipSlot.TwoHanded,
			itemEquipped = -1,
			itemMovementSpeed = -20,
			itemActionTime = 0.69,
			itemActionMovementSpeed = -0.30,
			itemHealing =
			{
				{
					itemRarity = ClassItem.Rarity.Junk,
					minValue = 19,
					maxValue = 21
				},
				{
					itemRarity = ClassItem.Rarity.Poor,
					minValue = 22,
					maxValue = 23
				},
				{
					itemRarity = ClassItem.Rarity.Common,
					minValue = 24,
					maxValue = 26
				},
				{
					itemRarity = ClassItem.Rarity.Uncommon,
					minValue = 26,
					maxValue = 28
				},
				{
					itemRarity = ClassItem.Rarity.Rare,
					minValue = 28,
					maxValue = 31
				},
				{
					itemRarity = ClassItem.Rarity.Epic,
					minValue = 31,
					maxValue = 34
				},
				{
					itemRarity = ClassItem.Rarity.Legendary,
					minValue = 34,
					maxValue = 37
				},
				{
					itemRarity = ClassItem.Rarity.Unique,
					minValue = 37,
					maxValue = 39
				}
			},
		},
		RoundShield = 
		{
			itemID = "",
			itemType = "RS",
			itemName = "Round Shield",
			itemBudgetValue = 100,
			itemMoneyValue = 0,
			itemDescription = "A shield for defense.",
			itemEquipSlot = ClassItem.EquipSlot.OneHanded,
			itemEquipped = -1,
			itemMovementSpeed = -12,
			itemActionTime = 0.5,
			itemActionMovementSpeed = -0.25,
			itemArmor =
			{
				{
					itemRarity = ClassItem.Rarity.Junk,
					minValue = 13,
					maxValue = 13
				},
				{
					itemRarity = ClassItem.Rarity.Poor,
					minValue = 19,
					maxValue = 19
				},
				{
					itemRarity = ClassItem.Rarity.Common,
					minValue = 26,
					maxValue = 26
				},
				{
					itemRarity = ClassItem.Rarity.Uncommon,
					minValue = 26,
					maxValue = 29
				},
				{
					itemRarity = ClassItem.Rarity.Rare,
					minValue = 29,
					maxValue = 32
				},
				{
					itemRarity = ClassItem.Rarity.Epic,
					minValue = 32,
					maxValue = 35
				},
				{
					itemRarity = ClassItem.Rarity.Legendary,
					minValue = 35,
					maxValue = 38
				},
				{
					itemRarity = ClassItem.Rarity.Unique,
					minValue = 38,
					maxValue = 41
				}
			},
		}
	}

ClassItem.ArmorType =
	{
		Armet =
		{
			itemID = "",
			itemType = "ARM",
			itemName = "Armet",
			itemBudgetValue = 100,
			itemMoneyValue = 0,
			itemDescription = "A plate helmet.",
			itemEquipSlot = ClassItem.EquipSlot.Head,
			itemEquipped = -1,
			itemMovementSpeed = -12,
			itemArmor =
			{
				{
					itemRarity = ClassItem.Rarity.Junk,
					minValue = 23,
					maxValue = 24
				},
				{
					itemRarity = ClassItem.Rarity.Poor,
					minValue = 25,
					maxValue = 27
				},
				{
					itemRarity = ClassItem.Rarity.Common,
					minValue = 28,
					maxValue = 31
				},
				{
					itemRarity = ClassItem.Rarity.Uncommon,
					minValue = 32,
					maxValue = 34
				},
				{
					itemRarity = ClassItem.Rarity.Rare,
					minValue = 34,
					maxValue = 36
				},
				{
					itemRarity = ClassItem.Rarity.Epic,
					minValue = 36,
					maxValue = 38
				},
				{
					itemRarity = ClassItem.Rarity.Legendary,
					minValue = 38,
					maxValue = 40
				},
				{
					itemRarity = ClassItem.Rarity.Unique,
					minValue = 40,
					maxValue = 43
				}
			},
		},
		LeatherCap =
		{
			itemID = "",
			itemType = "LC",
			itemName = "Leather Cap",
			itemBudgetValue = 100,
			itemMoneyValue = 0,
			itemDescription = "A leather cap.",
			itemEquipSlot = ClassItem.EquipSlot.Head,
			itemEquipped = -1,
			itemMovementSpeed = -5,
			itemArmor =
			{
				{
					itemRarity = ClassItem.Rarity.Junk,
					minValue = 11,
					maxValue = 12
				},
				{
					itemRarity = ClassItem.Rarity.Poor,
					minValue = 12,
					maxValue = 13
				},
				{
					itemRarity = ClassItem.Rarity.Common,
					minValue = 13,
					maxValue = 14
				},
				{
					itemRarity = ClassItem.Rarity.Uncommon,
					minValue = 15,
					maxValue = 16
				},
				{
					itemRarity = ClassItem.Rarity.Rare,
					minValue = 17,
					maxValue = 18
				},
				{
					itemRarity = ClassItem.Rarity.Epic,
					minValue = 19,
					maxValue = 20
				},
				{
					itemRarity = ClassItem.Rarity.Legendary,
					minValue = 20,
					maxValue = 21
				},
				{
					itemRarity = ClassItem.Rarity.Unique,
					minValue = 21,
					maxValue = 22
				}
			},
		},
		PaddedTunic =
		{
			itemID = "",
			itemType = "PT",
			itemName = "Padded Tunic",
			itemBudgetValue = 100,
			itemMoneyValue = 0,
			itemDescription = "A basic cloth tunic.",
			itemEquipSlot = ClassItem.EquipSlot.Chest,
			itemEquipped = -1,
			itemMovementSpeed = -5,
			itemArmor =
			{
				{
					itemRarity = ClassItem.Rarity.Junk,
					minValue = 10,
					maxValue = 10
				},
				{
					itemRarity = ClassItem.Rarity.Poor,
					minValue = 10,
					maxValue = 11
				},
				{
					itemRarity = ClassItem.Rarity.Common,
					minValue = 11,
					maxValue = 12
				},
				{
					itemRarity = ClassItem.Rarity.Uncommon,
					minValue = 13,
					maxValue = 14
				},
				{
					itemRarity = ClassItem.Rarity.Rare,
					minValue = 15,
					maxValue = 16
				},
				{
					itemRarity = ClassItem.Rarity.Epic,
					minValue = 17,
					maxValue = 18
				},
				{
					itemRarity = ClassItem.Rarity.Legendary,
					minValue = 18,
					maxValue = 19
				},
				{
					itemRarity = ClassItem.Rarity.Unique,
					minValue = 19,
					maxValue = 20
				}
			},
		},
		RegalGambeson =
		{
			itemID = "",
			itemType = "RG",
			itemName = "Regal Gambeson",
			itemBudgetValue = 100,
			itemMoneyValue = 0,
			itemDescription = "A high quality gambeson.",
			itemEquipSlot = ClassItem.EquipSlot.Chest,
			itemEquipped = -1,
			itemMovementSpeed = -15,
			itemArmor =
			{
				{
					itemRarity = ClassItem.Rarity.Junk,
					minValue = 34,
					maxValue = 35
				},
				{
					itemRarity = ClassItem.Rarity.Poor,
					minValue = 36,
					maxValue = 39
				},
				{
					itemRarity = ClassItem.Rarity.Common,
					minValue = 40,
					maxValue = 47
				},
				{
					itemRarity = ClassItem.Rarity.Uncommon,
					minValue = 48,
					maxValue = 51
				},
				{
					itemRarity = ClassItem.Rarity.Rare,
					minValue = 52,
					maxValue = 57
				},
				{
					itemRarity = ClassItem.Rarity.Epic,
					minValue = 57,
					maxValue = 62
				},
				{
					itemRarity = ClassItem.Rarity.Legendary,
					minValue = 62,
					maxValue = 66
				},
				{
					itemRarity = ClassItem.Rarity.Unique,
					minValue = 66,
					maxValue = 70
				}
			},
		},
		FineCuirass =
		{
			itemID = "",
			itemType = "FC",
			itemName = "Fine Cuirass",
			itemBudgetValue = 100,
			itemMoneyValue = 0,
			itemDescription = "High quality knigtly chest plate armor.",
			itemEquipSlot = ClassItem.EquipSlot.Chest,
			itemEquipped = -1,
			itemMovementSpeed = -35,
			itemArmor =
			{
				{
					itemRarity = ClassItem.Rarity.Junk,
					minValue = 60,
					maxValue = 61
				},
				{
					itemRarity = ClassItem.Rarity.Poor,
					minValue = 61,
					maxValue = 64
				},
				{
					itemRarity = ClassItem.Rarity.Common,
					minValue = 65,
					maxValue = 76
				},
				{
					itemRarity = ClassItem.Rarity.Uncommon,
					minValue = 77,
					maxValue = 88
				},
				{
					itemRarity = ClassItem.Rarity.Rare,
					minValue = 89,
					maxValue = 97
				},
				{
					itemRarity = ClassItem.Rarity.Epic,
					minValue = 97,
					maxValue = 105
				},
				{
					itemRarity = ClassItem.Rarity.Legendary,
					minValue = 105,
					maxValue = 110
				},
				{
					itemRarity = ClassItem.Rarity.Unique,
					minValue = 110,
					maxValue = 115
				}
			},
		},
		PlatePants =
		{
			itemID = "",
			itemType = "PP",
			itemName = "Plate Pants",
			itemBudgetValue = 100,
			itemMoneyValue = 0,
			itemDescription = "A set of plate armor pants.",
			itemEquipSlot = ClassItem.EquipSlot.Legs,
			itemEquipped = -1,
			itemMovementSpeed = -18,
			itemArmor =
			{
				{
					itemRarity = ClassItem.Rarity.Junk,
					minValue = 25,
					maxValue = 26
				},
				{
					itemRarity = ClassItem.Rarity.Poor,
					minValue = 27,
					maxValue = 29
				},
				{
					itemRarity = ClassItem.Rarity.Common,
					minValue = 30,
					maxValue = 33
				},
				{
					itemRarity = ClassItem.Rarity.Uncommon,
					minValue = 34,
					maxValue = 36
				},
				{
					itemRarity = ClassItem.Rarity.Rare,
					minValue = 36,
					maxValue = 38
				},
				{
					itemRarity = ClassItem.Rarity.Epic,
					minValue = 38,
					maxValue = 40
				},
				{
					itemRarity = ClassItem.Rarity.Legendary,
					minValue = 40,
					maxValue = 42
				},
				{
					itemRarity = ClassItem.Rarity.Unique,
					minValue = 42,
					maxValue = 45
				}
			},
		},
		ClothPants =
		{
			itemID = "",
			itemType = "CP",
			itemName = "Cloth Pants",
			itemBudgetValue = 100,
			itemMoneyValue = 0,
			itemDescription = "Basic cloth pants.",
			itemEquipSlot = ClassItem.EquipSlot.Legs,
			itemEquipped = -1,
			itemMovementSpeed = -5,
			itemArmor =
			{
				{
					itemRarity = ClassItem.Rarity.Junk,
					minValue = 7,
					maxValue = 8
				},
				{
					itemRarity = ClassItem.Rarity.Poor,
					minValue = 8,
					maxValue = 9
				},
				{
					itemRarity = ClassItem.Rarity.Common,
					minValue = 9,
					maxValue = 10
				},
				{
					itemRarity = ClassItem.Rarity.Uncommon,
					minValue = 11,
					maxValue = 12
				},
				{
					itemRarity = ClassItem.Rarity.Rare,
					minValue = 13,
					maxValue = 14
				},
				{
					itemRarity = ClassItem.Rarity.Epic,
					minValue = 15,
					maxValue = 16
				},
				{
					itemRarity = ClassItem.Rarity.Legendary,
					minValue = 16,
					maxValue = 17
				},
				{
					itemRarity = ClassItem.Rarity.Unique,
					minValue = 17,
					maxValue = 18
				}
			},
		},
		HeavyGauntlets =
		{
			itemID = "",
			itemType = "HG",
			itemName = "Heavy Gauntlets",
			itemBudgetValue = 100,
			itemMoneyValue = 0,
			itemDescription = "A pair of plate gauntlets.",
			itemEquipSlot = ClassItem.EquipSlot.Hands,
			itemEquipped = -1,
			itemMovementSpeed = -3,
			itemArmor =
			{
				{
					itemRarity = ClassItem.Rarity.Junk,
					minValue = 11,
					maxValue = 12
				},
				{
					itemRarity = ClassItem.Rarity.Poor,
					minValue = 13,
					maxValue = 14
				},
				{
					itemRarity = ClassItem.Rarity.Common,
					minValue = 15,
					maxValue = 16
				},
				{
					itemRarity = ClassItem.Rarity.Uncommon,
					minValue = 17,
					maxValue = 18
				},
				{
					itemRarity = ClassItem.Rarity.Rare,
					minValue = 19,
					maxValue = 20
				},
				{
					itemRarity = ClassItem.Rarity.Epic,
					minValue = 21,
					maxValue = 22
				},
				{
					itemRarity = ClassItem.Rarity.Legendary,
					minValue = 22,
					maxValue = 23
				},
				{
					itemRarity = ClassItem.Rarity.Unique,
					minValue = 23,
					maxValue = 24
				}
			},
		},
		LeatherGloves =
		{
			itemID = "",
			itemType = "LG",
			itemName = "Leather Gloves",
			itemBudgetValue = 100,
			itemMoneyValue = 0,
			itemDescription = "A pair of leather gloves.",
			itemEquipSlot = ClassItem.EquipSlot.Hands,
			itemEquipped = -1,
			itemMovementSpeed = 0,
			itemArmor =
			{
				{
					itemRarity = ClassItem.Rarity.Junk,
					minValue = 2,
					maxValue = 3
				},
				{
					itemRarity = ClassItem.Rarity.Poor,
					minValue = 3,
					maxValue = 4
				},
				{
					itemRarity = ClassItem.Rarity.Common,
					minValue = 4,
					maxValue = 5
				},
				{
					itemRarity = ClassItem.Rarity.Uncommon,
					minValue = 5,
					maxValue = 6
				},
				{
					itemRarity = ClassItem.Rarity.Rare,
					minValue = 6,
					maxValue = 7
				},
				{
					itemRarity = ClassItem.Rarity.Epic,
					minValue = 7,
					maxValue = 8
				},
				{
					itemRarity = ClassItem.Rarity.Legendary,
					minValue = 8,
					maxValue = 9
				},
				{
					itemRarity = ClassItem.Rarity.Unique,
					minValue = 9,
					maxValue = 10
				}
			},
		},
		PlateBoots =
		{
			itemID = "",
			itemType = "PB",
			itemName = "Plate Boots",
			itemBudgetValue = 100,
			itemMoneyValue = 0,
			itemDescription = "A pair of plate boots.",
			itemEquipSlot = ClassItem.EquipSlot.Feet,
			itemEquipped = -1,
			itemMovementSpeed = 2,
			itemArmor =
			{
				{
					itemRarity = ClassItem.Rarity.Junk,
					minValue = 16,
					maxValue = 17
				},
				{
					itemRarity = ClassItem.Rarity.Poor,
					minValue = 18,
					maxValue = 19
				},
				{
					itemRarity = ClassItem.Rarity.Common,
					minValue = 20,
					maxValue = 21
				},
				{
					itemRarity = ClassItem.Rarity.Uncommon,
					minValue = 22,
					maxValue = 23
				},
				{
					itemRarity = ClassItem.Rarity.Rare,
					minValue = 24,
					maxValue = 25
				},
				{
					itemRarity = ClassItem.Rarity.Epic,
					minValue = 26,
					maxValue = 27
				},
				{
					itemRarity = ClassItem.Rarity.Legendary,
					minValue = 28,
					maxValue = 29
				},
				{
					itemRarity = ClassItem.Rarity.Unique,
					minValue = 30,
					maxValue = 31
				}
			},
		},
		AdventurerBoots =
		{
			itemID = "",
			itemType = "AB",
			itemName = "Adventurer Boots",
			itemBudgetValue = 100,
			itemMoneyValue = 0,
			itemDescription = "A pair of sturdy adventurer boots.",
			itemEquipSlot = ClassItem.EquipSlot.Feet,
			itemEquipped = -1,
			itemMovementSpeed = 5,
			itemArmor =
			{
				{
					itemRarity = ClassItem.Rarity.Junk,
					minValue = 5,
					maxValue = 6
				},
				{
					itemRarity = ClassItem.Rarity.Poor,
					minValue = 6,
					maxValue = 7
				},
				{
					itemRarity = ClassItem.Rarity.Common,
					minValue = 7,
					maxValue = 8
				},
				{
					itemRarity = ClassItem.Rarity.Uncommon,
					minValue = 9,
					maxValue = 10
				},
				{
					itemRarity = ClassItem.Rarity.Rare,
					minValue = 11,
					maxValue = 12
				},
				{
					itemRarity = ClassItem.Rarity.Epic,
					minValue = 13,
					maxValue = 14
				},
				{
					itemRarity = ClassItem.Rarity.Legendary,
					minValue = 14,
					maxValue = 15
				},
				{
					itemRarity = ClassItem.Rarity.Unique,
					minValue = 15,
					maxValue = 16
				}
			},
		},
		AdventurerCloak =
		{
			itemID = "",
			itemType = "AC",
			itemName = "Adventurer Cloak",
			itemBudgetValue = 100,
			itemMoneyValue = 0,
			itemDescription = "A warm cloak used by adventurers.",
			itemEquipSlot = ClassItem.EquipSlot.Back,
			itemEquipped = -1,
			itemMovementSpeed = 0,
			itemArmor =
			{
				{
					itemRarity = ClassItem.Rarity.Junk,
					minValue = 3,
					maxValue = 4
				},
				{
					itemRarity = ClassItem.Rarity.Poor,
					minValue = 4,
					maxValue = 5
				},
				{
					itemRarity = ClassItem.Rarity.Common,
					minValue = 5,
					maxValue = 6
				},
				{
					itemRarity = ClassItem.Rarity.Uncommon,
					minValue = 6,
					maxValue = 7
				},
				{
					itemRarity = ClassItem.Rarity.Rare,
					minValue = 7,
					maxValue = 8
				},
				{
					itemRarity = ClassItem.Rarity.Epic,
					minValue = 8,
					maxValue = 9
				},
				{
					itemRarity = ClassItem.Rarity.Legendary,
					minValue = 9,
					maxValue = 10
				},
				{
					itemRarity = ClassItem.Rarity.Unique,
					minValue = 10,
					maxValue = 11
				}
			},
		},
	}

ClassItem.JewleryType =
	{
		Pendant = 1,
		Ring = 2
	}

ClassItem.ConsumableType =
	{
		Torch = 
		{
			itemID = "",
			itemType = "TOR",
			itemName = "Torch",
			itemBudgetValue = 100,
			itemMoneyValue = 0,
			itemDescription = "A torch that can be thrown to light up a room.",
			itemEquipSlot = ClassItem.EquipSlot.Util1,
			itemEquipped = -1,
			itemActionTime = 1,
			itemActionMovementSpeed = -20,
			itemThrowable = true
		},
		Lockpick =
		{
			itemID = "",
			itemType = "LOPI",
			itemName = "Lockpick",
			itemBudgetValue = 100,
			itemMoneyValue = 0,
			itemDescription = "A lockpick used to pick locked chests."
		},
		Campfire = 
		{
			itemID = "",
			itemType = "CAMP",
			itemName = "Campfire",
			itemBudgetValue = 100,
			itemMoneyValue = 0,
			itemDescription = "A campfire you can rest at to heal over time.",
			itemEquipSlot = ClassItem.EquipSlot.Util1,
			itemEquipped = -1,
			itemActionTime = 15,
			itemActionMovementSpeed = -300,
			itemHealing = 3,
			itemTime =
			{
				{
					itemRarity = ClassItem.Rarity.Junk,
					minValue = 15,
					maxValue = 15
				},
				{
					itemRarity = ClassItem.Rarity.Poor,
					minValue = 18,
					maxValue = 18
				},
				{
					itemRarity = ClassItem.Rarity.Common,
					minValue = 21,
					maxValue = 21
				},
				{
					itemRarity = ClassItem.Rarity.Uncommon,
					minValue = 24,
					maxValue = 24
				},
				{
					itemRarity = ClassItem.Rarity.Rare,
					minValue = 27,
					maxValue = 27
				},
				{
					itemRarity = ClassItem.Rarity.Epic,
					minValue = 30,
					maxValue = 30
				},
				{
					itemRarity = ClassItem.Rarity.Legendary,
					minValue = 33,
					maxValue = 33
				},
				{
					itemRarity = ClassItem.Rarity.Unique,
					minValue = 36,
					maxValue = 36
				}
			},
		},
		Bandage = 
		{
			itemID = "",
			itemType = "BAND",
			itemName = "Bandage",
			itemBudgetValue = 100,
			itemMoneyValue = 0,
			itemDescription = "A bandage that instantly heals some health.",
			itemEquipSlot = ClassItem.EquipSlot.Util1,
			itemEquipped = -1,
			itemActionTime = 6,
			itemActionMovementSpeed = -20,
			itemHealing =
			{
				{
					itemRarity = ClassItem.Rarity.Junk,
					minValue = 8,
					maxValue = 9
				},
				{
					itemRarity = ClassItem.Rarity.Poor,
					minValue = 9,
					maxValue = 10
				},
				{
					itemRarity = ClassItem.Rarity.Common,
					minValue = 14,
					maxValue = 15
				},
				{
					itemRarity = ClassItem.Rarity.Uncommon,
					minValue = 19,
					maxValue = 20
				},
				{
					itemRarity = ClassItem.Rarity.Rare,
					minValue = 24,
					maxValue = 25
				},
				{
					itemRarity = ClassItem.Rarity.Epic,
					minValue = 29,
					maxValue = 30
				},
				{
					itemRarity = ClassItem.Rarity.Legendary,
					minValue = 34,
					maxValue = 35
				},
				{
					itemRarity = ClassItem.Rarity.Unique,
					minValue = 39,
					maxValue = 40
				}
			},
		},
		HealingPotion = 
		{
			itemID = "",
			itemType = "HPOT",
			itemName = "Healing Potion",
			itemBudgetValue = 100,
			itemMoneyValue = 0,
			itemDescription = "A potion that heals health over time.",
			itemEquipSlot = ClassItem.EquipSlot.Util1,
			itemEquipped = -1,
			itemActionTime = 1,
			itemActionMovementSpeed = -20,
			itemTime = 20,
			itemHealing =
			{
				{
					itemRarity = ClassItem.Rarity.Junk,
					minValue = 11,
					maxValue = 12
				},
				{
					itemRarity = ClassItem.Rarity.Poor,
					minValue = 14,
					maxValue = 15
				},
				{
					itemRarity = ClassItem.Rarity.Common,
					minValue = 18,
					maxValue = 19
				},
				{
					itemRarity = ClassItem.Rarity.Uncommon,
					minValue = 22,
					maxValue = 23
				},
				{
					itemRarity = ClassItem.Rarity.Rare,
					minValue = 26,
					maxValue = 27
				},
				{
					itemRarity = ClassItem.Rarity.Epic,
					minValue = 30,
					maxValue = 31
				},
				{
					itemRarity = ClassItem.Rarity.Legendary,
					minValue = 41,
					maxValue = 42
				},
				{
					itemRarity = ClassItem.Rarity.Unique,
					minValue = 49,
					maxValue = 50
				}
			},
		},
		ManaPotion = 
		{
			itemID = "",
			itemType = "MPOT",
			itemName = "Mana Potion",
			itemBudgetValue = 100,
			itemMoneyValue = 0,
			itemDescription = "A potion that restores mana over time.",
			itemEquipSlot = ClassItem.EquipSlot.Util1,
			itemEquipped = -1,
			itemActionTime = 1,
			itemActionMovementSpeed = -20,
			itemAddMana = 20,
			itemTime =
			{
				{
					itemRarity = ClassItem.Rarity.Junk,
					minValue = 2,
					maxValue = 2
				},
				{
					itemRarity = ClassItem.Rarity.Poor,
					minValue = 3,
					maxValue = 3
				},
				{
					itemRarity = ClassItem.Rarity.Common,
					minValue = 4,
					maxValue = 4
				},
				{
					itemRarity = ClassItem.Rarity.Uncommon,
					minValue = 5,
					maxValue = 5
				},
				{
					itemRarity = ClassItem.Rarity.Rare,
					minValue = 6,
					maxValue = 6
				},
				{
					itemRarity = ClassItem.Rarity.Epic,
					minValue = 7,
					maxValue = 7
				},
				{
					itemRarity = ClassItem.Rarity.Legendary,
					minValue = 8,
					maxValue = 8
				},
				{
					itemRarity = ClassItem.Rarity.Unique,
					minValue = 9,
					maxValue = 9
				}
			},
		},
		ShieldPotion = 
		{
			itemID = "",
			itemType = "SPOT",
			itemName = "Shield Potion",
			itemBudgetValue = 100,
			itemMoneyValue = 0,
			itemDescription = "A potion that grants a protective shield.",
			itemEquipSlot = ClassItem.EquipSlot.Util1,
			itemEquipped = -1,
			itemActionTime = 1,
			itemActionMovementSpeed = -20,
			itemTime = 24,
			itemShield =
			{
				{
					itemRarity = ClassItem.Rarity.Junk,
					minValue = 14,
					maxValue = 15
				},
				{
					itemRarity = ClassItem.Rarity.Poor,
					minValue = 19,
					maxValue = 20
				},
				{
					itemRarity = ClassItem.Rarity.Common,
					minValue = 24,
					maxValue = 25
				},
				{
					itemRarity = ClassItem.Rarity.Uncommon,
					minValue = 29,
					maxValue = 30
				},
				{
					itemRarity = ClassItem.Rarity.Rare,
					minValue = 34,
					maxValue = 35
				},
				{
					itemRarity = ClassItem.Rarity.Epic,
					minValue = 39,
					maxValue = 40
				},
				{
					itemRarity = ClassItem.Rarity.Legendary,
					minValue = 44,
					maxValue = 45
				},
				{
					itemRarity = ClassItem.Rarity.Unique,
					minValue = 49,
					maxValue = 50
				}
			},
		},
		InvisPotion = 
		{
			itemID = "",
			itemType = "SPOT",
			itemName = "Shield Potion",
			itemBudgetValue = 100,
			itemMoneyValue = 0,
			itemDescription = "A potion that grants a protective shield.",
			itemEquipSlot = ClassItem.EquipSlot.Util1,
			itemEquipped = -1,
			itemActionTime = 1,
			itemActionMovementSpeed = -20,
			itemInvisible = true,
			itemTime =
			{
				{
					itemRarity = ClassItem.Rarity.Junk,
					minValue = 10,
					maxValue = 10
				},
				{
					itemRarity = ClassItem.Rarity.Poor,
					minValue = 20,
					maxValue = 20
				},
				{
					itemRarity = ClassItem.Rarity.Common,
					minValue = 30,
					maxValue = 30
				},
				{
					itemRarity = ClassItem.Rarity.Uncommon,
					minValue = 40,
					maxValue = 40
				},
				{
					itemRarity = ClassItem.Rarity.Rare,
					minValue = 50,
					maxValue = 50
				},
				{
					itemRarity = ClassItem.Rarity.Epic,
					minValue = 60,
					maxValue = 60
				},
				{
					itemRarity = ClassItem.Rarity.Legendary,
					minValue = 70,
					maxValue = 70
				},
				{
					itemRarity = ClassItem.Rarity.Unique,
					minValue = 80,
					maxValue = 80
				}
			},
		},
		HuntingTrap = 
		{
			itemID = "",
			itemType = "TRAP",
			itemName = "Hunting Trap",
			itemBudgetValue = 100,
			itemMoneyValue = 0,
			itemDescription = "A trap that can immobalize enemies.",
			itemEquipSlot = ClassItem.EquipSlot.Util1,
			itemEquipped = -1,
			itemActionMovementSpeed = -300,
			itemDamage = 1,
			itemActionTime =
			{
				{
					itemRarity = ClassItem.Rarity.Junk,
					minValue = 7,
					maxValue = 7
				},
				{
					itemRarity = ClassItem.Rarity.Poor,
					minValue = 6,
					maxValue = 6
				},
				{
					itemRarity = ClassItem.Rarity.Common,
					minValue = 5,
					maxValue = 5
				},
				{
					itemRarity = ClassItem.Rarity.Uncommon,
					minValue = 4,
					maxValue = 4
				},
				{
					itemRarity = ClassItem.Rarity.Rare,
					minValue = 3,
					maxValue = 3
				},
				{
					itemRarity = ClassItem.Rarity.Epic,
					minValue = 2,
					maxValue = 2
				},
				{
					itemRarity = ClassItem.Rarity.Legendary,
					minValue = 1,
					maxValue = 1
				},
				{
					itemRarity = ClassItem.Rarity.Unique,
					minValue = 1,
					maxValue = 1
				}
			},
		},
		ThrowingAxe = 
		{
			itemID = "",
			itemType = "TA",
			itemName = "Throwing Axe",
			itemBudgetValue = 100,
			itemMoneyValue = 0,
			itemDescription = "A throwing axe.",
			itemEquipSlot = ClassItem.EquipSlot.Util1,
			itemEquipped = -1,
			itemActionTime = 0,
			itemActionMovementSpeed = 0,
			itemThrowable = true,
			itemDamage =
			{
				{
					itemRarity = ClassItem.Rarity.Junk,
					minValue = 15,
					maxValue = 15
				},
				{
					itemRarity = ClassItem.Rarity.Poor,
					minValue = 20,
					maxValue = 20
				},
				{
					itemRarity = ClassItem.Rarity.Common,
					minValue = 25,
					maxValue = 25
				},
				{
					itemRarity = ClassItem.Rarity.Uncommon,
					minValue = 30,
					maxValue = 30
				},
				{
					itemRarity = ClassItem.Rarity.Rare,
					minValue = 35,
					maxValue = 35
				},
				{
					itemRarity = ClassItem.Rarity.Epic,
					minValue = 40,
					maxValue = 40
				},
				{
					itemRarity = ClassItem.Rarity.Legendary,
					minValue = 45,
					maxValue = 45
				},
				{
					itemRarity = ClassItem.Rarity.Unique,
					minValue = 50,
					maxValue = 50
				}
			},
		},
		Molotov = 
		{
			itemID = "",
			itemType = "MTOV",
			itemName = "Explosion Bottle",
			itemBudgetValue = 100,
			itemMoneyValue = 0,
			itemDescription = "A throwable bottle that will cause an area to burn.",
			itemEquipSlot = ClassItem.EquipSlot.Util1,
			itemEquipped = -1,
			itemActionTime = 0,
			itemActionMovementSpeed = 0,
			itemThrowable = true,
			itemDamage =
			{
				{
					itemRarity = ClassItem.Rarity.Junk,
					minValue = 10,
					maxValue = 10
				},
				{
					itemRarity = ClassItem.Rarity.Poor,
					minValue = 20,
					maxValue = 20
				},
				{
					itemRarity = ClassItem.Rarity.Common,
					minValue = 30,
					maxValue = 30
				},
				{
					itemRarity = ClassItem.Rarity.Uncommon,
					minValue = 40,
					maxValue = 40
				},
				{
					itemRarity = ClassItem.Rarity.Rare,
					minValue = 50,
					maxValue = 50
				},
				{
					itemRarity = ClassItem.Rarity.Epic,
					minValue = 60,
					maxValue = 60
				},
				{
					itemRarity = ClassItem.Rarity.Legendary,
					minValue = 70,
					maxValue = 70
				},
				{
					itemRarity = ClassItem.Rarity.Unique,
					minValue = 80,
					maxValue = 80
				}
			},
		},
	}

ClassItem.LootableType =
	{
		GoldGoblet =
		{
			itemID = "",
			itemType = "GG",
			itemName = "GoldGoblet",
			itemDescription = "A piece of loot that is worth money.",
			itemBudgetValue = 
			{
				{
					itemRarity = ClassItem.Rarity.Junk,
					minValue = 2,
					maxValue = 2
				},
				{
					itemRarity = ClassItem.Rarity.Poor,
					minValue = 4,
					maxValue = 4
				},
				{
					itemRarity = ClassItem.Rarity.Common,
					minValue = 6,
					maxValue = 6
				},
				{
					itemRarity = ClassItem.Rarity.Uncommon,
					minValue = 14,
					maxValue = 14
				},
				{
					itemRarity = ClassItem.Rarity.Rare,
					minValue = 31,
					maxValue = 31
				},
				{
					itemRarity = ClassItem.Rarity.Epic,
					minValue = 53,
					maxValue = 53
				},
				{
					itemRarity = ClassItem.Rarity.Legendary,
					minValue = 87,
					maxValue = 87
				},
				{
					itemRarity = ClassItem.Rarity.Unique,
					minValue = 100,
					maxValue = 100
				}
			},
			itemMoneyValue =
			{
				{
					itemRarity = ClassItem.Rarity.Junk,
					minValue = 2,
					maxValue = 2
				},
				{
					itemRarity = ClassItem.Rarity.Poor,
					minValue = 4,
					maxValue = 4
				},
				{
					itemRarity = ClassItem.Rarity.Common,
					minValue = 6,
					maxValue = 6
				},
				{
					itemRarity = ClassItem.Rarity.Uncommon,
					minValue = 14,
					maxValue = 14
				},
				{
					itemRarity = ClassItem.Rarity.Rare,
					minValue = 31,
					maxValue = 31
				},
				{
					itemRarity = ClassItem.Rarity.Epic,
					minValue = 53,
					maxValue = 53
				},
				{
					itemRarity = ClassItem.Rarity.Legendary,
					minValue = 87,
					maxValue = 87
				},
				{
					itemRarity = ClassItem.Rarity.Unique,
					minValue = 100,
					maxValue = 100
				}
			},
		},
	}

ClassItem.ToolType =
	{
		SoulHeart = 
		{
			itemID = "",
			itemType = "SH",
			itemName = "Soul Heart",
			itemDescription = "Can be used on an Altar of Resurrection to revive fallen teammates.",
			itemPlayer = nil
		},
	}

type itemData = { [string] : string | number | boolean }
local genGUID = require(game.ServerScriptService.GenerateGUID)
local random = Random.new()

--Generates a name for Unique rarity items using chatGPT
local function generateUniqueName(): string
	task.synchronize()
	
	task.desynchronize()
	return
end

--[[
Create a new item with parameters string iType (the specific item name, e.g. Shortsword)
and number 1-8 rarity. Returns a dictionary of item attributes.
]]
function ClassItem:new(iType: string, rarity: number): itemData
	task.desynchronize()
	local itemData = {}
	local activeComponent = ""
	local randomAttributes = {}
	
	--Find which category iType is under
	local category = self:GetItemTypeCategory(iType)
	
	--Iterate over every key value pair in the iType definition and add it to itemData, which will be the returned item data
	for key, value in pairs(self[category][iType]) do
		if typeof(value) == "table" then --Check if the value is a table, which means it is a random value based on rarity.
			table.insert(randomAttributes, key)
			continue
		elseif key == "itemType" then
			itemData[key] = iType --generate with long iType, not short which is the value
			continue
		end
		
		itemData[key] = value
	end
	
	itemData.itemID = genGUID.generate()
	itemData["itemRarity"] = rarity
	
	--Generate value for each random attribute and save the random attributes to a string for saving to datastore
	local attributesToSave = ""
	for i, attribute in randomAttributes do
		itemData[attribute] = random:NextInteger(self[category][iType][attribute][rarity]["minValue"], self[category][iType][attribute][rarity]["maxValue"])
		
		if string.len(attributesToSave) == 0 then
			attributesToSave = attribute
		else
			attributesToSave ..= `,{attribute}`
		end
	end
	
	itemData["attributesToSave"] = attributesToSave

	if rarity == ClassItem.Rarity.Unique then
		itemData.itemName = generateUniqueName()
	end
	
	--Note that the function calls task.desynchronize() but does not call synchronize. Synchronize must be called outside of the function to return to serial execution.
	return itemData
end

--Returns a dictionary of longType = shortType for all item types that exist
function ClassItem:GetAllItemTypes(): {[string] : string}
	local iTypes = {}
	
	for _, cat in pairs(self.Category) do
		if cat ~= "WeaponType" then --temp
			continue
		end
		for key, value in pairs(self[cat]) do
			iTypes[key] = self[cat][key]["itemType"]
		end
	end
	
	return iTypes
end

--Returns -1 if no iType budgetValue found
function ClassItem:GetItemTypeBudgetValue(iType: string): number
	for _, cat in pairs(self.Category) do
		for key, value in pairs(self[cat]) do
			if key == iType then
				return self[cat][key]["itemBudgetValue"] --TODO: if table then get the value from the rarity, allowing random budget value
			end
		end
	end
	
	return -1
end

--Returns the category the item type defnition is listed under.
function ClassItem:GetItemTypeCategory(iType: string): string
	local category = ""
	
	for _, cat in pairs(self.Category) do
		local found = false
		for curType, __ in pairs(self[cat]) do
			if curType == iType then
				category = cat
				found = true
				break
			end
		end
		if found then
			break
		end
	end
	
	return category
end

return ClassItem
