RegisterNetEvent('BS-Storerobbery:server:alert',function()
    local src = source
    local coords = GetEntityCoords(GetPlayerPed(src))
    BSGetSheriffs(function(sheriffs)
        for i = 1, #sheriffs do
            if Config.Framework == "RSG" then
                TriggerClientEvent('rsg-lawman:client:lawmanAlert',sheriffs[i],coords, "A place is being robbed! You have to go here immediately")
            else
                Notify({
                    source = sheriffs[i],
                    text = "A place is being robbed! You have to go here immediately!",
                    time = 5000,
                    type = "error"
                })
                TriggerClientEvent('BS-Storerobbery:client:alert',sheriffs[i],coords)
            end
        end
    end)
end)
RegisterNetEvent('BS-Storerobbery:server:setData',function(k,i,timer)
    Config.RobLocations[k].rob[i].robbedtime = timer
    TriggerClientEvent('BS-Storerobbery:client:setData',-1,Config.RobLocations)
end)
RegisterNetEvent('BS-Storerobbery:server:reward',function(data,removeLocpick)
    local src = source
    local reward = false
    for i = 1, #data do
        if math.random() > data[i].chance then
            reward = data[i]
        end
    end
    if removeLocpick then
        BSRemoveItem(src,Config.LockpickItem,1)
    end
    if not reward then
        return Notify({
            source = src,
            text = "You didn't find anything.",
            time = 5000,
            type = "error"
        })
    end
    if reward.type == "money" then
        BSAddMoney(src,reward.name,reward.count)
        Notify({
            source = src,
            text = "You found $"..reward.count,
            time = 5000,
            type = "info"
        })
    elseif reward.type == "item" then
        BSAddItem(src,reward.name,reward.count)
        Notify({
            source = src,
            text = "You found "..reward.count.."x "..reward.label,
            time = 5000,
            type = "info"
        })
    end
end)

RegisterNetEvent('BS-Storerobbery:server:getData',function()
    TriggerClientEvent('BS-Storerobbery:client:setData',source,Config.RobLocations)
end)
