global.SaveData = {
	Saves: [
		{
			IsEmpty: true,
			Character: {
				Class: undefined,
				Status: {
					Life: {
						Max: 0,
						Atual: 0,
						Regen: 0
					},
					Stamina: {
						Max: 0,
						Atual: 0,
						Regen: 0
					},
					Mana: {
						Max: 0,
						Atual: 0,
						Regen: 0
					},
					Armor: {
						Atual: 0,
						Buffed: 0	
					},
					Strenght: {
						Atual: 0,
						Buffed: 0
					},	
					Level: {
						XP: 0,
						LimitXP: 0,
						Count: 0
					},
					Bulk: 0
				},
				Movimentation: {
					Speed: {
						Vertical: 0,
						Horizontal: 0
					}
				},
				Combat: {
					Wield: false,
					Dash: {
						Distance: 0
					}
				},
				Local: {
					Room: undefined,
					_x: undefined,
					_y: undefined
				}
			},
		},
		{
			IsEmpty: true,
			Character: {
				Class: undefined,
				Status: {
					Life: {
						Max: 0,
						Atual: 0,
						Regen: 0
					},
					Stamina: {
						Max: 0,
						Atual: 0,
						Regen: 0
					},
					Mana: {
						Max: 0,
						Atual: 0,
						Regen: 0
					},
					Armor: {
						Atual: 0,
						Buffed: 0	
					},
					Strenght: {
						Atual: 0,
						Buffed: 0
					},	
					Level: {
						XP: 0,
						LimitXP: 0,
						Count: 0
					},
					Bulk: 0
				},
				Movimentation: {
					Speed: {
						Vertical: 0,
						Horizontal: 0
					}
				},
				Combat: {
					Wield: false,
					Dash: {
						Distance: 0
					}
				},
				Local: {
					Room: undefined,
					_x: undefined,
					_y: undefined
				}
			},
		},
		{
			IsEmpty: true,
			Character: {
				Class: undefined,
				Status: {
					Life: {
						Max: 0,
						Atual: 0,
						Regen: 0
					},
					Stamina: {
						Max: 0,
						Atual: 0,
						Regen: 0
					},
					Mana: {
						Max: 0,
						Atual: 0,
						Regen: 0
					},
					Armor: {
						Atual: 0,
						Buffed: 0	
					},
					Strenght: {
						Atual: 0,
						Buffed: 0
					},	
					Level: {
						XP: 0,
						LimitXP: 0,
						Count: 0
					},
					Bulk: 0
				},
				Movimentation: {
					Speed: {
						Vertical: 0,
						Horizontal: 0
					}
				},
				Combat: {
					Wield: false,
					Dash: {
						Distance: 0
					}
				},
				Local: {
					Room: undefined,
					_x: undefined,
					_y: undefined
				}
			},
		}
	],
	Settings: {
		Commands: {
			Keyboard: {
				Left:   "A",
				Right:  "D",
				Jump:   vk_space,
				Attack: mb_left,
				Dash:   "S",
				// @Warrior
				Wield:  "E",
			}
		}
	},
	LastSavePlayed: undefined
};

function CreateSave () constructor {
	SaveStructEmpty = {
		IsEmpty: true,
		Character: {
			Class: undefined,
			Status: {
				Life: {
					Max: 0,
					Atual: 0,
					Regen: 0
				},
				Stamina: {
					Max: 0,
					Atual: 0,
					Regen: 0
				},
				Mana: {
					Max: 0,
					Atual: 0,
					Regen: 0
				},
				Armor: {
					Atual: 0,
					Buffed: 0	
				},
				Strenght: {
					Atual: 0,
					Buffed: 0
				},	
				Level: {
					XP: 0,
					LimitXP: 0,
					Count: 0
				},
				Bulk: 0
			},
			Movimentation: {
				Speed: {
					Vertical: 0,
					Horizontal: 0
				}
			},
			Combat: {
				Wield: false,
				Dash: {
					Distance: 0
				}
			},
			Local: {
				Room: undefined,
				_x: undefined,
				_y: undefined
			}
		}
	}
	
	static Save = function () {
		var json   = json_stringify(global.SaveData);
		var buffer = buffer_create(string_byte_length(json) + 1, buffer_fixed, 1);
		
		buffer_write(buffer, buffer_string, json);
		
		buffer_save(buffer, FILESAVENAME);
		buffer_delete(buffer);
	}
	static Load = function (saveIndex) {
		if (!new Utils(undefined).VerifySaveFileExists()) exit;
		 
		var buffer = buffer_load(FILESAVENAME);
		var json   = buffer_read(buffer, buffer_string);
		 
		buffer_delete(buffer);
		 
		var saveData = json_parse(json);
		
		global.SaveData.Saves[saveIndex] = array_get(saveData.Saves, saveIndex);
		global.SaveData.Settings = struct_get(saveData, "Settings");
		global.SaveData.LastSavePlayed = struct_get(saveData, "LastSavePlayed");
	}
	static Delete = function (saveIndex) {
		global.SaveData.Saves[saveIndex] = SaveStructEmpty
		
		array_sort(global.SaveData.Saves, function (save1, save2) { return save1.IsEmpty - save2.IsEmpty })
		
		new CreateSave().Save();
		new CreateSave().LoadAllStruct();
	}
	static LoadAllStruct = function () {
		if (!new Utils(undefined).VerifySaveFileExists()) exit;
		 
		var buffer = buffer_load(FILESAVENAME);
		var json   = buffer_read(buffer, buffer_string);
		 
		buffer_delete(buffer);
		 
		var saveData = json_parse(json);
		
		for (var i = 0; i < new CreateSave().CountAllSaves(); i++)
			global.SaveData.Saves[i] = array_get(saveData.Saves, i);
			
		global.SaveData.Settings = struct_get(saveData, "Settings");
		global.SaveData.LastSavePlayed = struct_get(saveData, "LastSavePlayed");
	}
	static CountAllSaves = function () {
		if (!new Utils(undefined).VerifySaveFileExists()) return 0;
		
		var countSaves = 0;
		
		var buffer = buffer_load(FILESAVENAME);
		var json   = buffer_read(buffer, buffer_string);
		 
		buffer_delete(buffer);
		 
		var saveData = json_parse(json);
		
		for (var i = 0; i < array_length(saveData.Saves); i++) {
			if (!saveData.Saves[i].IsEmpty) countSaves++
		}
		
		return countSaves;
	}
}