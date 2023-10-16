global.SaveData = {
	LastSavePlayed: undefined,
	Saves: [
		{
			IsEmpty: true,
			Character: {
				Class: undefined,
				Status: {
					Life: undefined,
					Mana: undefined,
					Armor: undefined,
					Strength: undefined
				},
				Items: {
					Coins: undefined,
					Potions: {
						Life: {
							Count: 0
						},
						Mana: {
							Count: 0
						}
					},
					Equipaments: {
					
					}
				},
				Progression: {
					Level: {
						Count: 0,
						Experience: 0
					},
				}
			},
			Room: {
				Local: undefined,
				_x: undefined,
				_y: undefined
			}
		},
		{
			IsEmpty: true,
			LastSavePlayed: false,
			Character: {
				Class: undefined,
				Status: {
					Life: undefined,
					Mana: undefined,
					Armor: undefined,
					Strength: undefined
				},
				Items: {
					Coins: undefined,
					Potions: {
						Life: {
							Count: 0
						},
						Mana: {
							Count: 0
						}
					},
					Equipaments: {
					
					}
				},
				Progression: {
					Level: {
						Count: 0,
						Experience: 0
					},
				}
			},
			Room: {
				Local: undefined,
				_x: undefined,
				_y: undefined
			}
		},
		{
			IsEmpty: true,
			LastSavePlayed: false,
			Character: {
				Class: undefined,
				Status: {
					Life: undefined,
					Mana: undefined,
					Armor: undefined,
					Strength: undefined
				},
				Items: {
					Coins: undefined,
					Potions: {
						Life: {
							Count: 0
						},
						Mana: {
							Count: 0
						}
					},
					Equipaments: {
					
					}
				},
				Progression: {
					Level: {
						Count: 0,
						Experience: 0
					},
				}
			},
			Room: {
				Local: undefined,
				_x: undefined,
				_y: undefined
			}
		}
	],
	Settings: {
		Controllers: {
			Type: DeviceController.Keyboard,
			Commands: {
				Keyboard: {
					Dash:   "S",
					Left:   "A",
					Right:  "D",
					Jump:   vk_space,
					Attack: mb_left,
					
					// @Warrior
					Wield:  "E",
					
					// @Wizard
					Teleport: "E"
				}
			}
		}
	}
}

function CreateSave () constructor {
	static Save = function () {
		var json   = json_stringify(global.SaveData);
		var buffer = buffer_create(string_byte_length(json) + 1, buffer_fixed, 1);
		
		buffer_write(buffer, buffer_string, json);
		
		buffer_save(buffer, FILESAVENAME);
		buffer_delete(buffer);
	}
	static Load = function (saveIndex) {
		if (!new Utils().VerifySaveFileExists()) exit;
		 
		var buffer = buffer_load(FILESAVENAME);
		var json   = buffer_read(buffer, buffer_string);
		 
		buffer_delete(buffer);
		 
		var saveData = json_parse(json);
		
		global.SaveData.LastSavePlayed = struct_get(saveData, "LastSavePlayed");
		global.SaveData.Saves[saveIndex] = array_get(saveData.Saves, saveIndex);
		global.SaveData.Settings = struct_get(saveData, "Settings");
	}
	static Delete = function (saveIndex) {
		if (!new Utils().VerifySaveFileExists()) exit;
		
		var modelStructUserDataEmpty = {
				IsEmpty: true,
				Character: {
					Class: undefined,
					Status: {
						Life: undefined,
						Mana: undefined,
						Armor: undefined,
						Strength: undefined
					},
					Items: {
						Coins: undefined,
						Potions: {
							Life: {
								Count: 0
							},
							Mana: {
								Count: 0
							}
						},
						Equipaments: {
					
						}
					},
					Progression: {
						Level: {
							Count: 0,
							Experience: 0
						},
					}
				},
				Room: {
					Local: undefined,
					_x: undefined,
					_y: undefined
				}
		};
		
		global.SaveData.Saves[saveIndex] = modelStructUserDataEmpty;
		
		new CreateSave().Save();
		new CreateSave().LoadAllStruct();
	}
	static LoadAllStruct = function () {
		if (!new Utils().VerifySaveFileExists()) exit;
		 
		var buffer = buffer_load(FILESAVENAME);
		var json   = buffer_read(buffer, buffer_string);
		 
		buffer_delete(buffer);
		 
		var saveData = json_parse(json);
		
		global.SaveData.LastSavePlayed = struct_get(saveData, "LastSavePlayed");
		global.SaveData.Settings = struct_get(saveData, "Settings");
		
		for (var i = 0; i < new CreateSave().CountAllSaves(); i++)
			global.SaveData.Saves[i] = array_get(saveData.Saves, i);
	}
	static CountAllSaves = function () {
		if (!new Utils().VerifySaveFileExists()) return 0;
		
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