local Keys = {
	["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57, 
	["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177, 
	["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
	["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
	["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
	["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70, 
	["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
	["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
	["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118
}

GUI              = {}
GUI.MenuIsShowed = false
GUI.Time         = 0

Character = {
	sex          = 0,
	face         = 0,
	skin         = 0,
	hair_1       = 0,
	hair_2       = 0,
	hair_color_1 = 0,
	hair_color_2 = 0,
	tshirt_1     = 0,
	tshirt_2     = 0,
	torso_1      = 0,
	torso_2      = 0,
	decals_1     = 0,
	decals_2     = 0,
	arms         = 0,
	pants_1      = 0,
	pants_2      = 0,
	shoes        = 0,
	helmet_1     = 0,
	helmet_2     = 0,
	glasses_1    = 0,
	glasses_2    = 0
}

LastSex     = 0;
LoadSkin    = nil;
LoadClothes = nil;

AddEventHandler('skinchanger:modelLoaded', function()

	if LoadSkin ~= nil then

		local playerPed = GetPlayerPed(-1)

		SetPedHeadBlendData(playerPed, LoadSkin['face'], LoadSkin['face'], LoadSkin['face'], LoadSkin['skin'], LoadSkin['skin'], LoadSkin['skin'], 1.0, 1.0, 1.0, true)
		
		SetPedComponentVariation(playerPed, 2, LoadSkin['hair_1'], LoadSkin['hair_2'], 2)	      -- Hair
		SetPedHairColor(playerPed, LoadSkin['hair_color_1'], LoadSkin['hair_color_2']) 		      -- Hair Color
		SetPedComponentVariation(playerPed, 8,  LoadSkin['tshirt_1'], LoadSkin['tshirt_2'], 2)  -- Tshirt
		SetPedComponentVariation(playerPed, 11, LoadSkin['torso_1'], LoadSkin['torso_2'], 2)    -- torso parts
		SetPedComponentVariation(playerPed, 3, LoadSkin['arms'], 0, 2)                          -- torso
		SetPedComponentVariation(playerPed, 10, LoadSkin['decals_1'], LoadSkin['decals_2'], 2)  -- decals
		SetPedComponentVariation(playerPed, 4, LoadSkin['pants_1'], LoadSkin['pants_2'], 2)     -- pants
		SetPedComponentVariation(playerPed, 6, LoadSkin['shoes'], 0, 2) 									      -- shoes
		SetPedPropIndex(playerPed, 0, LoadSkin['helmet_1'], LoadSkin['helmet_2'], 2)            -- Helmet
		SetPedPropIndex(playerPed, 1, LoadSkin['glasses_1'], LoadSkin['glasses_2'], 2)          -- Glasses

		LoadSkin = nil

	end

	if LoadClothes ~= nil then

		local playerPed = GetPlayerPed(-1)

		SetPedHeadBlendData(playerPed, LoadClothes.playerSkin['face'], LoadClothes.playerSkin['face'], LoadClothes.playerSkin['face'], LoadClothes.playerSkin['skin'], LoadClothes.playerSkin['skin'], LoadClothes.playerSkin['skin'], 1.0, 1.0, 1.0, true)
		
		SetPedComponentVariation(playerPed, 2, LoadClothes.playerSkin['hair_1'], LoadClothes.playerSkin['hair_2'], 2)	      -- Hair
		SetPedHairColor(playerPed, LoadClothes.playerSkin['hair_color_1'], LoadClothes.playerSkin['hair_color_2']) 		      -- Hair Color
		
		SetPedComponentVariation(playerPed, 8,  LoadClothes.jobSkin['tshirt_1'], LoadClothes.jobSkin['tshirt_2'], 2)  -- Tshirt
		SetPedComponentVariation(playerPed, 11, LoadClothes.jobSkin['torso_1'], LoadClothes.jobSkin['torso_2'], 2)    -- torso parts
		SetPedComponentVariation(playerPed, 3, LoadClothes.jobSkin['arms'], 0, 2)                          -- torso
		SetPedComponentVariation(playerPed, 10, LoadClothes.jobSkin['decals_1'], LoadClothes.jobSkin['decals_2'], 2)  -- decals
		SetPedComponentVariation(playerPed, 4, LoadClothes.jobSkin['pants_1'], LoadClothes.jobSkin['pants_2'], 2)     -- pants
		SetPedComponentVariation(playerPed, 6, LoadClothes.jobSkin['shoes'], 0, 2) 									      -- shoes
		SetPedPropIndex(playerPed, 0, LoadClothes.jobSkin['helmet_1'], LoadClothes.jobSkin['helmet_2'], 2)            -- Helmet
		SetPedPropIndex(playerPed, 1, LoadClothes.jobSkin['glasses_1'], LoadClothes.jobSkin['glasses_2'], 2)          -- Glasses

		LoadClothes = nil

	end

end)

RegisterNetEvent('skinchanger:loadSkin')
AddEventHandler('skinchanger:loadSkin', function(skin)
	
	LoadSkin = skin

	if skin['sex'] == 0 then
		TriggerEvent('skinchanger:LoadDefaultModel', true)
	else
		TriggerEvent('skinchanger:LoadDefaultModel', false)
	end

end)

RegisterNetEvent('skinchanger:loadClothes')
AddEventHandler('skinchanger:loadClothes', function(playerSkin, jobSkin)
	
	LoadClothes = {
		playerSkin = playerSkin,
		jobSkin    = jobSkin
	}

	if playerSkin['sex'] == 0 then
		TriggerEvent('skinchanger:LoadDefaultModel', true)
	else
		TriggerEvent('skinchanger:LoadDefaultModel', false)
	end

end)

AddEventHandler('skinchanger:openMenu', function()
	
	SendNUIMessage({
		setDisplay = true,
		vals       = Character,
		maxVals    = GetMaxVals()
	}) 

	GUI.MenuIsShowed = true
end)

AddEventHandler('skinchanger:openMenuWithArgs', function(skin)
	
	Character = skin

	SendNUIMessage({
		setDisplay = true,
		vals       = Character,
		maxVals    = GetMaxVals()
	}) 

	GUI.MenuIsShowed = true
end)

AddEventHandler('skinchanger:closeMenu', function()
	SendNUIMessage({
		setDisplay = false
	})

	GUI.MenuIsShowed = false
end)

RegisterNUICallback('change', function(data, cb)

	local playerPed = GetPlayerPed(-1)

	Character[data.target] = data.value

	if Character['sex'] ~= LastSex then
		if Character['sex'] == 0 then
			TriggerEvent('skinchanger:LoadDefaultModel', true)
		else
			TriggerEvent('skinchanger:LoadDefaultModel', false)
		end
	end

	LastSex = Character['sex']

	SetPedHeadBlendData(playerPed, Character['face'], Character['face'], Character['face'], Character['skin'], Character['skin'], Character['skin'], 1.0, 1.0, 1.0, true)
	
	SetPedComponentVariation(playerPed, 2, Character['hair_1'], Character['hair_2'], 2)	      -- Hair
	SetPedHairColor(playerPed, Character['hair_color_1'], Character['hair_color_2']) 		      -- Hair Color
	SetPedComponentVariation(playerPed, 8,  Character['tshirt_1'], Character['tshirt_2'], 2)  -- Tshirt
	SetPedComponentVariation(playerPed, 11, Character['torso_1'], Character['torso_2'], 2)    -- torso parts
	SetPedComponentVariation(playerPed, 10, Character['decals_1'], Character['decals_2'], 2)  -- decals
	SetPedComponentVariation(playerPed, 3, Character['arms'], 0, 2)                           -- torso
	SetPedComponentVariation(playerPed, 4, Character['pants_1'], Character['pants_2'], 2)     -- pants
	SetPedComponentVariation(playerPed, 6, Character['shoes'], 0, 2) 									   	    -- shoes
	SetPedPropIndex(playerPed, 0, Character['helmet_1'], Character['helmet_2'], 2)            -- Helmet
	SetPedPropIndex(playerPed, 1, Character['glasses_1'], Character['glasses_2'], 2)          -- Glasses

	SendNUIMessage({
		maxVals = GetMaxVals()
	})

	TriggerEvent('skinchanger:change', Character)

	cb('ok')

end)

function GetMaxVals()

  local playerPed = GetPlayerPed(-1)

	return {
		sex          = 1,
		face         = 45,
		skin         = 45,
		hair_1       = GetNumberOfPedDrawableVariations(playerPed, 2),
		hair_2       = GetNumberOfPedTextureVariations(playerPed, 2, Character['hair_1']),
		hair_color_1 = 22,
		hair_color_2 = 4,
		tshirt_1     = GetNumberOfPedDrawableVariations(playerPed, 8),
		tshirt_2     = GetNumberOfPedTextureVariations(playerPed, 8, Character['tshirt_1']),
		torso_1      = GetNumberOfPedDrawableVariations(playerPed, 11),
		torso_2      = GetNumberOfPedTextureVariations(playerPed, 11, Character['torso_1']),
		decals_1     = GetNumberOfPedDrawableVariations(playerPed, 10),
		decals_2     = GetNumberOfPedTextureVariations(playerPed, 10, Character['decals_1']),
		arms         = GetNumberOfPedDrawableVariations(playerPed, 3),
		pants_1      = GetNumberOfPedDrawableVariations(playerPed, 4),
		pants_2      = GetNumberOfPedTextureVariations(playerPed, 4, Character['pants_1']),
		shoes        = GetNumberOfPedDrawableVariations(playerPed, 6),
		helmet_1     = GetNumberOfPedPropDrawableVariations(playerPed, 0),
		helmet_2     = GetNumberOfPedTextureVariations(playerPed, 0, Character['helmet_1']),
		glasses_1    = GetNumberOfPedPropDrawableVariations(playerPed, 1),
		glasses_2    = GetNumberOfPedTextureVariations(playerPed, 1, Character['glasses_1']),
	}

end

-- Menu interactions
Citizen.CreateThread(function()
	while true do

  	Wait(0)

    if IsControlPressed(0, Keys["LEFT"]) and GUI.MenuIsShowed and (GetGameTimer() - GUI.Time) > 150 then

			SendNUIMessage({
				move = 'LEFT',
			})

	  	GUI.Time = GetGameTimer()
    end

    if IsControlPressed(0, Keys["RIGHT"]) and GUI.MenuIsShowed and (GetGameTimer() - GUI.Time) > 150 then

			SendNUIMessage({
				move = 'RIGHT'
			})

	  	GUI.Time = GetGameTimer()
    end

    if IsControlPressed(0, Keys["TOP"]) and GUI.MenuIsShowed and (GetGameTimer() - GUI.Time) > 150 then

			SendNUIMessage({
				move = 'UP'
			})

	  	GUI.Time = GetGameTimer()
    end

    if IsControlPressed(0, Keys["DOWN"]) and GUI.MenuIsShowed and (GetGameTimer() - GUI.Time) > 150 then

			SendNUIMessage({
				move = 'DOWN'
			})

	  	GUI.Time = GetGameTimer()
    end

    if IsControlPressed(0, Keys["ENTER"]) and GUI.MenuIsShowed and (GetGameTimer() - GUI.Time) > 150 then

    	TriggerEvent('skinchanger:onSubmit', Character)

	  	GUI.Time = GetGameTimer()
    end

    if IsControlPressed(0, Keys["BACKSPACE"]) and GUI.MenuIsShowed and (GetGameTimer() - GUI.Time) > 150 then

    	TriggerEvent('skinchanger:closeMenu')

	  	GUI.Time = GetGameTimer()
    end

  end
end)
