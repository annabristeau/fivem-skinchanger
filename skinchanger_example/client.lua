local HasLoadedModel = false;
local Skin       = nil


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
	TriggerServerEvent('skinchanger:saveData', skin)
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