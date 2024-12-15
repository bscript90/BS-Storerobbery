Config = {}
Config.Framework = "VORP" -- RSG

Config.AlertJobs = {
    -- jobname = true,
    -- if rsgcore is selected you should type jobtype
    ["sheriff"] = true,
    ["leo"] = true,
}

Config.LockpickItem = "lockpick"

Config.RobLocations = {
    ["RhodesStore"] = {
        npc = {
            PedSpawnDistance = 30,
            coords = vector4(1330.3423, -1293.5815, 77.0214, 63.0110),
            model = "S_M_M_UNIBUTCHERS_01",
            anims = {
                dict = false,
                name = false,
            },
            wander = {
                coords = {
                    [1] = {coord = vector4(1321.2644, -1299.5011, 76.3611, 135.4227), timeout = 30000},
                    [2] = {coord = vector4(1330.3423, -1293.5815, 77.0214, 63.0110), timeout = 30000},
                },
                time = 10, --second
            }
        },
        rob = {
            [1] = {
                coord = vector3(1324.9496, -1293.0205, 77.0259),
                robtext = "[E] | Search The Shelves",
                robbedtext = "Empty shelves",
                robTime = 5, --second
                robAnimation = {
                    dict = "amb_work@world_human_bartender@serve_player",
                    name = "take_glass_trans_serve_beer",
                },
                robCooldown = 5, -- minute
                needLockpick = false,
                reward = {
                    {type="item",label="Vodka",name="vodka",count=1,chance = 0.5},
                    {type="money",name="cash",count=50,chance = 0.5},
                    {type="money",name="gold",count=50,chance = 0.5},
                }
            },
            [2] = {
                coord = vector3(1325.3719, -1290.2758, 77.0244),
                robtext = "[E] | Search The Shelves",
                robbedtext = "Empty shelves",
                robTime = 5, --second
                needLockpick = false,
                robAnimation = {
                    dict = "amb_work@world_human_bartender@serve_player",
                    name = "take_glass_trans_serve_beer",
                },
                robCooldown = 5, -- minute
                reward = {
                    {type="item",label="Vodka",name="vodka",count=1,chance = 0.5},
                    {type="money",name="cash",count=50,chance = 0.5},
                    {type="money",name="gold",count=50,chance = 0.5},
                }
            },
            [3] = {
                coord = vector3(1326.9609, -1288.8717, 77.0169),
                robtext = "[E] | Search The Shelves",
                robbedtext = "Empty shelves",
                robTime = 5, --second
                needLockpick = false,
                robAnimation = {
                    dict = "amb_work@world_human_bartender@serve_player",
                    name = "take_glass_trans_serve_beer",
                },
                robCooldown = 5, -- minute
                reward = {
                    {type="item",label="Vodka",name="vodka",count=1,chance = 0.5},
                    {type="money",name="cash",count=50,chance = 0.5},
                    {type="money",name="gold",count=50,chance = 0.5},
                }
            },
            [4] = {
                coord = vector3(1330.3423, -1293.5815, 77.0214),
                robtext = "[E] | Search The Register",
                robbedtext = "Empty Register",
                robTime = 5, --second
                needLockpick = true,
                robAnimation = {
                    dict = "mech_pickup@loot@cash_register@open",
                    name = "enter_step_in",
                },
                robCooldown = 5, -- minute
                reward = {
                    {type="money",name="cash",count=50,chance = 0.5},
                    {type="money",name="gold",count=5,chance = 0.5},
                }
            },
        }
    },
    ["ValentineStore"] = {
        npc = {
            PedSpawnDistance = 30,
            coords = vector4(-324.628, 803.9818, 116.88, -81.17),
            model = "S_M_M_UNIBUTCHERS_01",
            anims = {
                dict = false,
                name = false,
            },
            wander = {
                coords = {
                    [1] = {coord = vector4(-328.4706, 793.9232, 117.9313, 126.9772), timeout = 30000},
                    [2] = {coord = vector4(-320.1578, 794.5004, 117.8862, 191.8929), timeout = 30000},
                    [3] = {coord = vector4(-324.628, 803.9818, 116.88, -81.17), timeout = 30000},
                },
                time = 10, --second
            }
        },
        rob = {
            [1] = {
                coord = vector3(-321.1941, 806.4278, 117.8816),
                robtext = "[E] | Search The Shelves",
                robbedtext = "Empty shelves",
                robTime = 5, --second
                robAnimation = {
                    dict = "amb_work@world_human_bartender@serve_player",
                    name = "take_glass_trans_serve_beer",
                },
                robCooldown = 5, -- minute
                needLockpick = false,
                reward = {
                    {type="item",label="Vodka",name="vodka",count=1,chance = 0.5},
                    {type="money",name="cash",count=50,chance = 0.5},
                    {type="money",name="gold",count=50,chance = 0.5},
                }
            },
            [2] = {
                coord = vector3(-320.9331, 804.5903, 117.8816),
                robtext = "[E] | Search The Shelves",
                robbedtext = "Empty shelves",
                robTime = 5, --second
                robAnimation = {
                    dict = "amb_work@world_human_bartender@serve_player",
                    name = "take_glass_trans_serve_beer",
                },
                robCooldown = 5, -- minute
                needLockpick = false,
                reward = {
                    {type="item",label="Vodka",name="vodka",count=1,chance = 0.5},
                    {type="money",name="cash",count=50,chance = 0.5},
                    {type="money",name="gold",count=50,chance = 0.5},
                }
            },
            [3] = {
                coord = vector3(-320.6136, 802.6233, 117.8816),
                robtext = "[E] | Search The Shelves",
                robbedtext = "Empty shelves",
                robTime = 5, --second
                needLockpick = false,
                robAnimation = {
                    dict = "amb_work@world_human_bartender@serve_player",
                    name = "take_glass_trans_serve_beer",
                },
                robCooldown = 5, -- minute
                reward = {
                    {type="item",label="Vodka",name="vodka",count=1,chance = 0.5},
                    {type="money",name="cash",count=50,chance = 0.5},
                    {type="money",name="gold",count=50,chance = 0.5},
                }
            },
            [4] = {
                coord = vector3(-323.7983, 797.2952, 117.8816),
                robtext = "[E] | Search The Shelves",
                robbedtext = "Empty shelves",
                robTime = 5, --second
                needLockpick = false,
                robAnimation = {
                    dict = "amb_work@world_human_bartender@serve_player",
                    name = "take_glass_trans_serve_beer",
                },
                robCooldown = 5, -- minute
                reward = {
                    {type="item",label="Vodka",name="vodka",count=1,chance = 0.5},
                    {type="money",name="cash",count=50,chance = 0.5},
                    {type="money",name="gold",count=50,chance = 0.5},
                }
            },
            [5] = {
                coord = vector3(-324.2396, 804.0859, 117.8816),
                robtext = "[E] | Search The Register",
                robbedtext = "Empty Register",
                robTime = 5, --second
                needLockpick = true,
                robAnimation = {
                    dict = "mech_pickup@loot@cash_register@open",
                    name = "enter_step_in",
                },
                robCooldown = 5, -- minute
                reward = {
                    {type="money",name="cash",count=50,chance = 0.5},
                    {type="money",name="gold",count=5,chance = 0.5},
                }
            },
        }
    },
    ["BlackwaterStore"] = {
        npc = {
            PedSpawnDistance = 30,
            coords = vector4(-784.738, -1321.73, 42.884, 179.63),
            model = "S_M_M_UNIBUTCHERS_01",
            anims = {
                dict = false,
                name = false,
            },
            wander = {
                coords = {
                    [1] = {coord = vector4(-792.3990, -1307.0165, 43.6197, 358.8164), timeout = 30000},
                    [2] = {coord = vector4(-784.738, -1321.73, 42.884, 179.63), timeout = 30000},
                },
                time = 10, --second
            }
        },
        rob = {
            [1] = {
                coord = vector3(-788.0798, -1326.8516, 43.8841),
                robtext = "[E] | Search The Shelves",
                robbedtext = "Empty shelves",
                robTime = 5, --second
                needLockpick = false,
                robAnimation = {
                    dict = "amb_work@world_human_bartender@serve_player",
                    name = "take_glass_trans_serve_beer",
                },
                robCooldown = 5, -- minute
                reward = {
                    {type="item",label="Vodka",name="vodka",count=1,chance = 0.5},
                    {type="money",name="cash",count=50,chance = 0.5},
                    {type="money",name="gold",count=50,chance = 0.5},
                }
            },
            [2] = {
                coord = vector3(-783.2593, -1326.5875, 43.8842),
                robtext = "[E] | Search The Shelves",
                robbedtext = "Empty shelves",
                robTime = 5, --second
                needLockpick = false,
                robAnimation = {
                    dict = "amb_work@world_human_bartender@serve_player",
                    name = "take_glass_trans_serve_beer",
                },
                robCooldown = 5, -- minute
                reward = {
                    {type="item",label="Vodka",name="vodka",count=1,chance = 0.5},
                    {type="money",name="cash",count=50,chance = 0.5},
                    {type="money",name="gold",count=50,chance = 0.5},
                }
            },
            [3] = {
                coord = vector3(-785.1981, -1326.5885, 43.8842),
                robtext = "[E] | Search The Shelves",
                robbedtext = "Empty shelves",
                robTime = 5, --second
                needLockpick = false,
                robAnimation = {
                    dict = "amb_work@world_human_bartender@serve_player",
                    name = "take_glass_trans_serve_beer",
                },
                robCooldown = 5, -- minute
                reward = {
                    {type="item",label="Vodka",name="vodka",count=1,chance = 0.5},
                    {type="money",name="cash",count=50,chance = 0.5},
                    {type="money",name="gold",count=50,chance = 0.5},
                }
            },
            [4] = {
                coord = vector3(-782.1234, -1321.5460, 43.8842),
                robtext = "[E] | Search The Shelves",
                robbedtext = "Empty shelves",
                robTime = 5, --second
                needLockpick = false,
                robAnimation = {
                    dict = "amb_work@world_human_bartender@serve_player",
                    name = "take_glass_trans_serve_beer",
                },
                robCooldown = 5, -- minute
                reward = {
                    {type="item",label="Vodka",name="vodka",count=1,chance = 0.5},
                    {type="money",name="cash",count=50,chance = 0.5},
                    {type="money",name="gold",count=50,chance = 0.5},
                }
            },
            [5] = {
                coord = vector3(-785.3131, -1322.7378, 43.8842),
                robtext = "[E] | Search The Register",
                robbedtext = "Empty Register",
                robTime = 5, --second
                needLockpick = true,
                robAnimation = {
                    dict = "mech_pickup@loot@cash_register@open",
                    name = "enter_step_in",
                },
                robCooldown = 5, -- minute
                reward = {
                    {type="money",name="cash",count=50,chance = 0.5},
                    {type="money",name="gold",count=5,chance = 0.5},
                }
            },
        }
    }
}

function Notify(data)
    local text = data.text or "No message" 
    local time = data.time or 5000  
    local type = data.type or "info" 
    local src = data.source

    if IsDuplicityVersion() then
        if Config.Framework == "RSG" then
            TriggerClientEvent('ox_lib:notify', src, { title = text, type = type, duration = time })
        elseif Config.Framework == "VORP" then
            TriggerClientEvent("vorp:TipBottom",src, text, time, type)
        end
    else
        if Config.Framework == "RSG" then
            TriggerEvent('ox_lib:notify', { title = text, type = type, duration = time })
        elseif Config.Framework == "VORP" then
            TriggerEvent("vorp:TipBottom", text, time, type)
        end
    end
end