RegisterServerEvent('skinchanger:saveData')
AddEventHandler('skinchanger:saveData', function(skin)

	local data = json.encode(skin)

  -- Here you can save data variable in MySQL DB
  -- Ici vous pouvez sauvegarder la variable data dans une base de données MySQL

end)