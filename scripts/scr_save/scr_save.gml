global.SaveData = {
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
					Dash:   vk_space,
					Left:   "A",
					Right:  "D",
					Jump:   "S",
					Attack: mb_left,
					
					// @Warrior
					Wield:  "E",
					
					// @Wizard
				}
			}
		}
	}
}

function CreateSave () constructor {
	static Save = function () {
		var json   = json_stringify(global.SaveState);
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
		 
		var saveState = json_parse(json);
		 
		global.SaveState.Saves[saveIndex] = array_get(saveState.Saves, saveIndex);
		global.SaveState.Settings = struct_get(saveState, "Settings");
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
	}
	static CountAllSaves = function () {
		if (!new Utils().VerifySaveFileExists()) exit;
		
		var countSaves = 0;
		
		var buffer = buffer_load(FILESAVENAME);
		var json   = buffer_read(buffer, buffer_string);
		 
		buffer_delete(buffer);
		 
		var saveState = json_parse(json);
		
		for (var i = 0; i < array_length(saveState.Saves); i++) {
			if (!saveState.Saves[i].IsEmpty) countSaves++
		}
		
		return countSaves;
	}
}