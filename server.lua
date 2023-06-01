local QBCore = exports['qb-core']:GetCoreObject()

-- Events

RegisterNetEvent('cc-drugrunner:client:GiveBox', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local item = 'bullshark'
    local quantity = '1'

    Player.Functions.AddItem(item, quantity)
end)

RegisterNetEvent('cc-drugrunner:client:DeliverBox', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local item = 'bullshark'
    local item2 = 'drug_payment'
    local quantity = '1'

    Player.Functions.RemoveItem(item, quantity)
    Player.Functions.AddItem(item2, quantity)
end)

RegisterNetEvent('cc-drugrunner:server:ReceivePayment', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local item = 'drug_payment'
    local quantity = 1
    local payment = Config.Payment

    Player.Functions.RemoveItem(item, quantity)
    Player.Functions.AddMoney('bank', payment)
end)

RegisterNetEvent('server:policeAlert', function(coords, text)
    local players = QBCore.Functions.GetQBPlayers()
    for _, v in pairs(players) do
        if v and v.PlayerData.job.name == 'police' and v.PlayerData.job.onduty then
            TriggerClientEvent('client:policeAlert', v.PlayerData.source, coords)
        end
    end
end)

RegisterNetEvent('server:policeNotification', function(coords, text)
    local players = QBCore.Functions.GetQBPlayers()
    for _, v in pairs(players) do
        if v and v.PlayerData.job.name == 'police' and v.PlayerData.job.onduty then
            TriggerClientEvent('client:policeNotification', v.PlayerData.source)
        end
    end
end)

QBCore.Functions.CreateCallback('server:GetCops', function(source, cb)
    local cops = 0
    for k, v in pairs(QBCore.Functions.GetQBPlayers()) do
        if (v.PlayerData.job.name == "police") and v.PlayerData.job.onduty then
            cops = cops + 1
        end
    end
    if (cops >= Config.copsRequired) then
        cb(true)
    else
        cb(false)
    end
end)