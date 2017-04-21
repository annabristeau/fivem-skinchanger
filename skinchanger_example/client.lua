local HasLoadedModel = false;
local Skin           = nil


AddEventHandler('playerSpawned', function(spawn)
    TriggerEvent('skinchanger:LoadDefaultModel', true)
end)

AddEventHandler('skinchanger:modelLoaded', function(skin)
    TriggerEvent('skinchanger:openMenu')
end)


AddEventHandler('skinchanger:change', function(skin)
    Skin = skin
end)

AddEventHandler('skinchanger:onSubmit', function(skin)

    local data = json.encode(skin)

    -- Here you can save data variable in MySQL DB
    -- Ici vous pouvez sauvegarder la variable data dans une base de données MySQL

    TriggerEvent('skinchanger:closeMenu')
end)

Citizen.CreateThread(function()
    while true do

        Citizen.Wait(0)

        if GetEntityHealth(GetPlayerPed(-1)) == 0 then
            HasLoadedModel = false
        end

    end
end)