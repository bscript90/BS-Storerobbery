if Config.Framework == "VORP" then
    if IsDuplicityVersion() then
        -- serverside
        VorpCore = exports.vorp_core:GetCore()

        function BSAddItem(src,itemname,itemcount)
            exports.vorp_inventory:addItem(src, itemname, itemcount, nil)
        end

        function BSRemoveItem(src,itemname,itemcount)
            exports.vorp_inventory:subItem(src, itemname, itemcount, nil)
        end
        
        function BSAddMoney(src,moneytype,amount)
            local user = VorpCore.getUser(src)
            if not user then return end
            local character = user.getUsedCharacter
            character.addCurrency(moneytype == "gold" and 1 or 0, amount)
        end

        function BSGetSheriffs(cb)
            local sheriffs = {}
            for k,src in pairs(GetPlayers()) do
                local user = VorpCore.getUser(tonumber(src))
                if user then
                    local character = user.getUsedCharacter
                    local job = character.job
                    if Config.AlertJobs[job] then
                        sheriffs[#sheriffs+1] = src
                    end
                end
            end
            cb(sheriffs)
        end
    else
        -- clientside

        RegisterNetEvent('vorp:SelectedCharacter',function()
            TriggerServerEvent('BS-Storerobbery:server:getData')
        end)
        VorpCore = exports.vorp_core:GetCore()
    end
elseif Config.Framework == "RSG" then
    if IsDuplicityVersion() then
        -- serverside
        RSGCore = exports['rsg-core']:GetCoreObject()

        function BSAddItem(src,itemname,itemcount)
            local Player = RSGCore.Functions.GetPlayer(src)
            Player.Functions.AddItem(itemname, itemcount,false,nil)
        end
        
        function BSRemoveItem(src,itemname,itemcount)
            local Player = RSGCore.Functions.GetPlayer(src)
            Player.Functions.AddItem(itemname, itemcount,false,nil)
        end

        function BSAddMoney(src,moneytype,amount)
            local Player = RSGCore.Functions.GetPlayer(src)
            Player.Functions.AddMoney(moneytype, amount, 'BS-Storerobbery')
        end

        function BSGetSheriffs(cb)
            local sheriffs = {}
            for k,src in pairs(GetPlayers()) do
                print(k,src)
                local Player = RSGCore.Functions.GetPlayer(tonumber(src))
                print("aranıyor")
                if Player then
                    local job = Player.PlayerData.job.type
                    print(job)
                    if Config.AlertJobs[job] then
                        print(job.." var")
                        sheriffs[#sheriffs+1] = src
                    end
                end
            end
            cb(sheriffs)
        end
    else
        -- clientside
        RSGCore = exports['rsg-core']:GetCoreObject()

        RegisterNetEvent('RSGCore:Client:OnPlayerLoaded',function()
            TriggerServerEvent('BS-Storerobbery:server:getData')
        end)
    end
end
