local spawnedNPCs = {}
local Alerts = {}
RegisterNetEvent('BS-Storerobbery:client:setData',function(data)
    Config.RobLocations = data
end)

RegisterNetEvent('BS-Storerobbery:client:alert',function(coords)

    local sprite = 1001245999
    local scale = 0.5
    local label = "ROBBERY"
    local blipmodifier = `BLIP_MODIFIER_MP_ENEMY_HOLDING`

    local blip1 = N_0x554d9d53f696d002(1664425300, coords.x, coords.y, coords.z)
    local blip2 = Citizen.InvokeNative(0x45f13b7e0a15c880, 693035517, coords.x, coords.y, coords.z, 5.0)
    Citizen.InvokeNative(0x0DF2B55F717DDB10, blip1, false)
    Citizen.InvokeNative(0x662D364ABF16DE2F, blip1, blipmodifier)
    SetBlipSprite(blip1, sprite, 1)
    SetBlipScale(blip1, scale)
    Citizen.InvokeNative(0x9CB1A1623062F402, blip1, label)
    local id = #Alerts + 1
    Alerts[id] = {
        blip1 = blip1,
        blip2 = blip2
    }
    SetTimeout(5000,function()
        if Alerts[id] then
            RemoveBlip(Alerts[id].blip1)
            RemoveBlip(Alerts[id].blip2)
            Alerts[id] = nil
        end
    end)
end)

local function CanNPCSee(npc)
    local npcCoords = GetEntityCoords(npc)
    local playerCoords = GetEntityCoords(PlayerPedId())
    local npcHeading = GetEntityHeading(npc)
    local forwardVector = GetEntityForwardVector(npc)
    local toPlayerVector = vector3(playerCoords.x - npcCoords.x, playerCoords.y - npcCoords.y, playerCoords.z - npcCoords.z)

    local forwardUnit = forwardVector / math.sqrt(forwardVector.x^2 + forwardVector.y^2 + forwardVector.z^2)
    local toPlayerUnit = toPlayerVector / math.sqrt(toPlayerVector.x^2 + toPlayerVector.y^2 + toPlayerVector.z^2)
    local dotProduct = forwardUnit.x * toPlayerUnit.x + forwardUnit.y * toPlayerUnit.y + forwardUnit.z * toPlayerUnit.z
    if dotProduct > 0.5 then
        local rayHandle = StartShapeTestRay(npcCoords.x, npcCoords.y, npcCoords.z+1, playerCoords.x, playerCoords.y, playerCoords.z+1, -1, npc, 0)
        local _, hit, endCoords, surfaceNormal, entityHit = GetShapeTestResult(rayHandle)
        if hit == 0 then
            return true
        else
            return false
        end
    else
        return false
    end
end

local function DrawText3D(x,y,z, text,r,g,b)
    local onScreen, _x, _y = GetScreenCoordFromWorldCoord(x, y, z)
    local p = GetFinalRenderedCamCoord()
    local distance = GetDistanceBetweenCoords(p.x, p.y, p.z, x, y, z, 1)
    local px,py,pz = table.unpack(GetGameplayCamCoord())
    local dist = Vdist(px,py,pz, x,y,z, 1)
    if dist < 15 then
        if onScreen then
            local factor = (string.len(text)) / 160
            SetTextScale(0.35, 0.35)
        	SetTextFontForCurrentCommand(6)
        	SetTextColor(r, g, b, 255)
        	SetTextCentre(1)
            DrawSprite("feeds", "toast_bg", _x, _y+0.0150,(0.015+factor), 0.032, 0.1, 0, 0, 0, 190, 0)
        	DisplayText(CreateVarString(10, "LITERAL_STRING", text), _x, _y)
        end
    end
end


Citizen.CreateThread(function()
    while true do
        local sleep = 5000
        local ped = PlayerPedId()
        local coords = GetEntityCoords(ped)
        for k,v in pairs(Config.RobLocations) do
            for i = 1, #v.rob do
                if v.rob[i] then
                    if not v.rob[i].robbedtime then
                        v.rob[i].robbedtime = 0
                    end
                    local timediff = GetGameTimer() - v.rob[i].robbedtime
                    local calcToMS = v.rob[i].robCooldown * 1000 * 60
                    local dist = #(coords - v.rob[i].coord)
                    if dist < 1.5 then
                        sleep = 1
                        if timediff >= calcToMS then
                            DrawText3D(v.rob[i].coord.x,v.rob[i].coord.y,v.rob[i].coord.z,v.rob[i].robtext,255,255,255)
                            if IsControlJustPressed(0,0xCEFD9220) then
                                if v.rob[i].lockpick == true and Config.Framework == "RSG" then
                                    local hasItem = RSGCore.Functions.HasItem('lockpick', 1)
                                    if not hasItem then
                                        lib.notify({ title = 'You need lockpick', type = 'error', duration = 7000 })
                                        return
                                    end
                                    local success = lib.skillCheck({'easy', 'easy', {areaSize = 60, speedMultiplier = 1}, 'hard'}, {'e'})
                                    if not success then
                                        lib.notify({ title = 'You fail rob..', type = 'error', duration = 7000 })
                                        TriggerServerEvent('BS-Storerobbery:server:removeitem', 'lockpick', 1)
                                        return
                                    end
                                    TriggerServerEvent('BS-Storerobbery:server:removeitem', 'lockpick', 1)
                                end
                                v.rob[i].robbedtime = GetGameTimer()
                                TriggerServerEvent('BS-Storerobbery:server:setData',k,i,GetGameTimer())
                                TriggerServerEvent('BS-Storerobbery:server:alert')
                                local endTime = v.rob[i].robTime * 1000
                                endTime = endTime + GetGameTimer()
                                ClearPedTasks(PlayerPedId())
                                FreezeEntityPosition(PlayerPedId(),true)
                                Wait(1000)
                                if v.rob[i].robAnimation and v.rob[i].robAnimation.name then
                                    RequestAnimDict(v.rob[i].robAnimation.dict)
                                    while not HasAnimDictLoaded(v.rob[i].robAnimation.dict) do
                                        Citizen.Wait(100)
                                    end
                                    TaskPlayAnim(PlayerPedId(), v.rob[i].robAnimation.dict, v.rob[i].robAnimation.name, 1.0, -1.0, -1, 1, 0, true, 0, false, 0, false)
                                elseif v.rob[i].robAnimation then
                                    TaskStartScenarioInPlace(PlayerPedId(), GetHashKey(v.rob[i].robAnimation.dict), 0, true, false, false, false)
                                end
                                while endTime > GetGameTimer() do  
                                    if CanNPCSee(spawnedNPCs[k]) then
                                        SetPedRelationshipGroupHash(PlayerPedId(),AddRelationshipGroup("enemy"))
                                        SetRelationshipBetweenGroups(5, GetPedRelationshipGroupHash(spawnedNPCs[k]), GetPedRelationshipGroupHash(PlayerPedId()))
                                        TaskCombatPed(spawnedNPCs[k], PlayerPedId(), 0, 16)
                                        SetPedCombatMovement(spawnedNPCs[k], 3)
                                        FreezeEntityPosition(PlayerPedId(),false)
                                        Wait(4000)
                                    end  
                                    Wait(500)
                                end 
                                FreezeEntityPosition(PlayerPedId(),false)
                         
                                ClearPedTasks(PlayerPedId())
                                TriggerServerEvent('BS-Storerobbery:server:reward',v.rob[i].reward)
                            end
                        else
                            DrawText3D(v.rob[i].coord.x,v.rob[i].coord.y,v.rob[i].coord.z,v.rob[i].robbedtext,255,0,0)
                        end
                    elseif dist < 10 and sleep > 500 then
                        sleep = 500
                    end
                end
            end
        end
        Wait(sleep)
    end
end)

Citizen.CreateThread(function()
    while true do
        local ped = PlayerPedId()
        local coords = GetEntityCoords(ped)
        for k,v in pairs(Config.RobLocations) do
            local dist = #(coords - vector3(v.npc.coords.x,v.npc.coords.y,v.npc.coords.z))
            if dist > v.npc.PedSpawnDistance and spawnedNPCs[k] then
                DeleteEntity(spawnedNPCs[k])
                spawnedNPCs[k] = nil
            elseif dist < v.npc.PedSpawnDistance and not spawnedNPCs[k] then
                local modelHash = GetHashKey(v.npc.model)
                RequestModel(modelHash)
                while not HasModelLoaded(modelHash) do
                    Citizen.Wait(10)
                end
                local npc = CreatePed(modelHash, v.npc.coords.x, v.npc.coords.y, v.npc.coords.z, v.npc.coords.w, false, 0)
                Citizen.InvokeNative(0x283978A15512B2FE, npc, true)
                SetModelAsNoLongerNeeded(modelHash)
                SetEntityAsMissionEntity(npc, true, true)
                if v.npc.anims and v.npc.anims.name then
                    RequestAnimDict(v.npc.anims.dict)
                    while not HasAnimDictLoaded(v.npc.anims.dict) do
                        Citizen.Wait(100)
                    end
                    TaskPlayAnim(npc, v.npc.anims.dict, v.npc.anims.name, 1.0, -1.0, -1, 1, 0, true, 0, false, 0, false)
                elseif v.npc.anims then
                    TaskStartScenarioInPlace(npc, GetHashKey(v.npc.anims.dict), 0, true, false, false, false)
                end
                spawnedNPCs[k] = npc
                Citizen.CreateThread(function()
                    while spawnedNPCs[k] do
                        Wait(v.npc.wander.time*1000)
                        for i = 1, #v.npc.wander.coords do
                            if spawnedNPCs[k] then
                                local coord = v.npc.wander.coords[i].coord
                                TaskGoToCoordAnyMeans(spawnedNPCs[k], coord.x, coord.y, coord.z, 1.0, 0, 0, 0,0)
                                Wait(v.npc.wander.coords[i].timeout)
                                if not spawnedNPCs[k] then
                                    break
                                end
                            end
                        end
                        Wait(1000)
                    end
                end)
            end
        end
        Wait(5000)
    end
end)

AddEventHandler('onResourceStop', function(resourceName)
    if (GetCurrentResourceName() ~= resourceName) then
        return
    end

    for k,v in pairs(spawnedNPCs) do
        DeleteEntity(v)
    end

    for k,v in pairs(Alerts) do
        if v then
            RemoveBlip(v.blip1)
            RemoveBlip(v.blip2)
        end
    end
end)
