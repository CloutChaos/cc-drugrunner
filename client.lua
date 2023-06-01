local QBCore = exports['qb-core']:GetCoreObject()

-- Events

RegisterNetEvent('cc-drugrunner:client:OrderDelivery', function()
    TriggerEvent('animations:client:EmoteCommandStart', {"argue"})
    QBCore.Functions.Progressbar('speak_dealer', 'Talking To Brucie...', 5000, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function()
    TriggerEvent('animations:client:EmoteCommandStart', {"c"})
    QBCore.Functions.Notify('Brucie will send you an email soon, be sure to check your phone.', 'primary', 7500)

    TriggerServerEvent('police:server:policeAlert', 'Suspicious Hand-off')

    Wait(Config.DrugEmailWaitTime)

    TriggerServerEvent('gksphone:server:sendNewMail', {
        sender = 'Brucie',
        subject = 'Bullshark Delivery...',
        message = 'Hey, Brucie here I spoke to you recently and I saw that you were interested in doing some deliveries for me... anyways if you would like to help me, go to location on your gps and take some product from the boxes inside.',
        })

    Wait(100)

    SetNewWaypoint(Config.BoxesLocation)
    ExportBoxesTarget()
    end)
end)

RegisterNetEvent('cc-drugrunner:client:GiveBox', function()
    QBCore.Functions.TriggerCallback('QBCore:HasItem', function(HasItem)
        if not HasItem then
            TriggerEvent('animations:client:EmoteCommandStart', {"mechanic4"})
            QBCore.Functions.Progressbar('name_here', 'Searching Boxes...', 5000, false, true, {
                disableMovement = true,
                disableCarMovement = true,
                disableMouse = false,
                disableCombat = true,
            }, {}, {}, {}, function()
                TriggerEvent('animations:client:EmoteCommandStart', {"c"})
                TriggerEvent('cc-drugrunner:client:GiveLocation')
            end)
            else
                QBCore.Functions.Notify('You already have an order with you...', 'error', 7500)
            end
        end, 'bullshark')
end)

RegisterNetEvent('cc-drugrunner:client:GiveLocation', function()
    TriggerServerEvent('cc-drugrunner:client:GiveBox')
    Wait(1000)

    TriggerServerEvent('gksphone:server:sendNewMail', {
        sender = 'Brucie',
        subject = 'Bullshark Delivery...',
        message = 'Hey, you found the Brucie Juice I mentioned. Good shit, now go drop them off so people can start juicing!',
        })

    GiveDeliveryLocations()
end)

RegisterNetEvent('cc-drugrunner:client:DeliverBox', function()
    TriggerEvent('animations:client:EmoteCommandStart', {"knock"})
    QBCore.Functions.Progressbar('knock_door', 'Knocking On The Door...', 5000, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function()
    TriggerEvent('animations:client:EmoteCommandStart', {"c"})

    Wait(100)

    TriggerEvent('animations:client:EmoteCommandStart', {"mechanic4"})
    QBCore.Functions.Progressbar('knock_door', 'Leaving The Package...', 5000, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function()
    TriggerEvent('animations:client:EmoteCommandStart', {"c"})

    TriggerServerEvent('cc-drugrunner:client:DeliverBox')

    Wait(2500)

    TriggerServerEvent('gksphone:server:sendNewMail', {
        sender = 'Brucie',
        subject = 'Bullshark Delivery...',
        message = 'Hell Yeah! Thats what Im talking about, make your way to the drop! I knew I could count on you, now stop by and see me to split the profits! - Brucie Out!',
        })

        end)
    end)
end)

RegisterNetEvent('cc-drugrunner:client:ReceivePayment', function()
    TriggerEvent('animations:client:EmoteCommandStart', {"handshake"})
    QBCore.Functions.Progressbar('drug_payment', 'Receiving Payment...', 5000, false, true, { 
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function() 
        TriggerServerEvent('cc-drugrunner:server:ReceivePayment')
    end)
end)

-- Functions

function ExportBoxesTarget()
    exports['qb-target']:AddBoxZone("drug_boxes", Config.BoxesLocation, 2, 2, {
        name="drug_boxes",
        heading=0,
        debugpoly = false,
    }, {
        options = {
            {
            event = "cc-drugrunner:client:GiveBox",
            icon = "fas fa-box",
            label = "Search boxes",
            },
        },
        distance = 2.5
    })
end

function GiveDeliveryLocations()
    local prob = math.random(1, 10)

    if prob == 1 then
        ExportDeliveryTarget1()
        SetNewWaypoint(Config.DeliveryLocation1)
    elseif prob == 2 then
        ExportDeliveryTarget2()
        SetNewWaypoint(Config.DeliveryLocation2)
    elseif prob == 3 then
        ExportDeliveryTarget3()
        SetNewWaypoint(Config.DeliveryLocation3)
    elseif prob == 4 then
        ExportDeliveryTarget4()
        SetNewWaypoint(Config.DeliveryLocation4)
    elseif prob == 5 then
        ExportDeliveryTarget5()
        SetNewWaypoint(Config.DeliveryLocation5)
    elseif prob == 6 then
        ExportDeliveryTarget6()
        SetNewWaypoint(Config.DeliveryLocation6)
    elseif prob == 7 then
        ExportDeliveryTarget7()
        SetNewWaypoint(Config.DeliveryLocation7)
    elseif prob == 8 then
        ExportDeliveryTarget8()
        SetNewWaypoint(Config.DeliveryLocation8)
    elseif prob == 9 then
        ExportDeliveryTarget9()
        SetNewWaypoint(Config.DeliveryLocation9)
    elseif prob == 10 then
        ExportDeliveryTarget10()
        SetNewWaypoint(Config.DeliveryLocation10)
    end
end

function ExportDeliveryTarget1()
    exports['qb-target']:AddBoxZone("drug_delivery1", Config.DeliveryLocation1, 1, 1, {
        name="drug_delivery1",
        heading=0,
        debugpoly = false,
    }, {
        options = {
            {
            event = "cc-drugrunner:client:DeliverBox",
            icon = "fas fa-box",
            label = "Knock Door",
            },
        },
        distance = 2.5
    })
end

function ExportDeliveryTarget2()
    exports['qb-target']:AddBoxZone("drug_delivery2", Config.DeliveryLocation2, 1, 1, {
        name="drug_delivery2",
        heading=0,
        debugpoly = false,
    }, {
        options = {
            {
            event = "cc-drugrunner:client:DeliverBox",
            icon = "fas fa-box",
            label = "Knock Door",
            },
        },
        distance = 2.5
    })
end

function ExportDeliveryTarget3()
    exports['qb-target']:AddBoxZone("drug_delivery3", Config.DeliveryLocation3, 1, 1, {
        name="drug_delivery3",
        heading=0,
        debugpoly = false,
    }, {
        options = {
            {
            event = "cc-drugrunner:client:DeliverBox",
            icon = "fas fa-box",
            label = "Knock Door",
            },
        },
        distance = 2.5
    })
end

function ExportDeliveryTarget4()
    exports['qb-target']:AddBoxZone("drug_delivery4", Config.DeliveryLocation4, 1, 1, {
        name="drug_delivery4",
        heading=0,
        debugpoly = false,
    }, {
        options = {
            {
            event = "cc-drugrunner:client:DeliverBox",
            icon = "fas fa-box",
            label = "Knock Door",
            },
        },
        distance = 2.5
    })
end

function ExportDeliveryTarget5()
    exports['qb-target']:AddBoxZone("drug_delivery5", Config.DeliveryLocation5, 1, 1, {
        name="drug_delivery5",
        heading=0,
        debugpoly = false,
    }, {
        options = {
            {
            event = "cc-drugrunner:client:DeliverBox",
            icon = "fas fa-box",
            label = "Knock Door",
            },
        },
        distance = 2.5
    })
end

function ExportDeliveryTarget6()
    exports['qb-target']:AddBoxZone("drug_delivery6", Config.DeliveryLocation6, 1, 1, {
        name="drug_delivery6",
        heading=0,
        debugpoly = false,
    }, {
        options = {
            {
            event = "cc-drugrunner:client:DeliverBox",
            icon = "fas fa-box",
            label = "Knock Door",
            },
        },
        distance = 2.5
    })
end

function ExportDeliveryTarget7()
    exports['qb-target']:AddBoxZone("drug_delivery7", Config.DeliveryLocation7, 1, 1, {
        name="drug_delivery7",
        heading=0,
        debugpoly = false,
    }, {
        options = {
            {
            event = "cc-drugrunner:client:DeliverBox",
            icon = "fas fa-box",
            label = "Knock Door",
            },
        },
        distance = 2.5
    })
end

function ExportDeliveryTarget8()
    exports['qb-target']:AddBoxZone("drug_delivery8", Config.DeliveryLocation8, 1, 1, {
        name="drug_delivery8",
        heading=0,
        debugpoly = false,
    }, {
        options = {
            {
            event = "cc-drugrunner:client:DeliverBox",
            icon = "fas fa-box",
            label = "Knock Door",
            },
        },
        distance = 2.5
    })
end

function ExportDeliveryTarget9()
    exports['qb-target']:AddBoxZone("drug_delivery9", Config.DeliveryLocation9, 1, 1, {
        name="drug_delivery9",
        heading=0,
        debugpoly = false,
    }, {
        options = {
            {
            event = "cc-drugrunner:client:DeliverBox",
            icon = "fas fa-box",
            label = "Knock Door",
            },
        },
        distance = 2.5
    })
end

function ExportDeliveryTarget10()
    exports['qb-target']:AddBoxZone("drug_delivery10", Config.DeliveryLocation10, 1, 1, {
        name="drug_delivery10",
        heading=0,
        debugpoly = false,
    }, {
        options = {
            {
            event = "cc-drugrunner:client:DeliverBox",
            icon = "fas fa-box",
            label = "Knock Door",
            },
        },
        distance = 2.5
    })
end