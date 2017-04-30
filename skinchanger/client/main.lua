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
	beard_1      = 0,
	beard_2      = 0,
	beard_3      = 0,
	beard_4      = 0,
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

		Character = LoadSkin

		local playerPed = GetPlayerPed(-1)

		if LoadSkin['face'] ~= nil and LoadSkin['skin'] ~= nil then
			SetPedHeadBlendData(playerPed, LoadSkin['face'], LoadSkin['face'], LoadSkin['face'], LoadSkin['skin'], LoadSkin['skin'], LoadSkin['skin'], 1.0, 1.0, 1.0, true)
		end

		if LoadSkin['beard_1'] ~= nil and LoadSkin['beard_2'] ~= nil then
			SetPedHeadOverlay(playerPed,  1,  LoadSkin['beard_1'],  (LoadSkin['beard_2'] / 10) + 0.0)    -- Beard
		end

		if LoadSkin['beard_3'] ~= nil and LoadSkin['beard_4'] ~= nil then
			SetPedHeadOverlayColor(playerPed,  1,  1,  LoadSkin['beard_3'],  LoadSkin['beard_4'])        -- Beard Color
		end

		if LoadSkin['hair_1'] ~= nil and LoadSkin['hair_2'] ~= nil then
			SetPedComponentVariation(playerPed, 2, LoadSkin['hair_1'], LoadSkin['hair_2'], 2)	           -- Hair
		end

		if LoadSkin['hair_color_1'] ~= nil and LoadSkin['hair_color_2'] ~= nil then
			SetPedHairColor(playerPed, LoadSkin['hair_color_1'], LoadSkin['hair_color_2']) 		           -- Hair Color
		end

		if LoadSkin['tshirt_1'] ~= nil and LoadSkin['tshirt_2'] ~= nil then
			SetPedComponentVariation(playerPed, 8,  LoadSkin['tshirt_1'], LoadSkin['tshirt_2'], 2)       -- Tshirt
		end

		if LoadSkin['torso_1'] ~= nil and LoadSkin['torso_2'] ~= nil then
			SetPedComponentVariation(playerPed, 11, LoadSkin['torso_1'], LoadSkin['torso_2'], 2)         -- torso parts
		end

		if LoadSkin['arms'] then
			SetPedComponentVariation(playerPed, 3, LoadSkin['arms'], 0, 2)                               -- torso
		end

		if LoadSkin['decals_1'] ~= nil and LoadSkin['decals_2'] ~= nil then
			SetPedComponentVariation(playerPed, 10, LoadSkin['decals_1'], LoadSkin['decals_2'], 2)       -- decals
		end

		if LoadSkin['pants_1'] ~= nil and LoadSkin['pants_2'] ~= nil then
			SetPedComponentVariation(playerPed, 4, LoadSkin['pants_1'], LoadSkin['pants_2'], 2)          -- pants
		end

		if LoadSkin['shoes'] ~= nil then
			SetPedComponentVariation(playerPed, 6, LoadSkin['shoes'], 0, 2) 									           -- shoes
		end

		if LoadSkin['helmet_1'] ~= nil and LoadSkin['helmet_2'] ~= nil then
			SetPedPropIndex(playerPed, 0, LoadSkin['helmet_1'], LoadSkin['helmet_2'], 2)                 -- Helmet
		end

		if LoadSkin['glasses_1'] ~= nil and LoadSkin['glasses_2'] ~= nil then
			SetPedPropIndex(playerPed, 1, LoadSkin['glasses_1'], LoadSkin['glasses_2'], 2)               -- Glasses
		end

		LoadSkin = nil

	end

	if LoadClothes ~= nil then

		Character = {
			sex          = LoadClothes.playerSkin['sex'],
			face         = LoadClothes.playerSkin['face'],
			skin         = LoadClothes.playerSkin['skin'],
			beard_1      = LoadClothes.playerSkin['beard_1'],
			beard_2      = LoadClothes.playerSkin['beard_2'],
			hair_1       = LoadClothes.playerSkin['hair_1'],
			hair_2       = LoadClothes.playerSkin['hair_2'],
			hair_color_1 = LoadClothes.playerSkin['hair_color_1'],
			hair_color_2 = LoadClothes.playerSkin['hair_color_2'],
			tshirt_1     = LoadClothes.clothesSkin['tshirt_1'],
			tshirt_2     = LoadClothes.clothesSkin['tshirt_2'],
			torso_1      = LoadClothes.clothesSkin['torso_1'],
			torso_2      = LoadClothes.clothesSkin['torso_2'],
			decals_1     = LoadClothes.clothesSkin['arms'],
			decals_2     = LoadClothes.clothesSkin['decals_1'],
			arms         = LoadClothes.clothesSkin['decals_2'],
			pants_1      = LoadClothes.clothesSkin['pants_1'],
			pants_2      = LoadClothes.clothesSkin['pants_2'],
			shoes        = LoadClothes.clothesSkin['shoes'],
			helmet_1     = LoadClothes.clothesSkin['helmet_1'],
			helmet_2     = LoadClothes.clothesSkin['helmet_2'],
			glasses_1    = LoadClothes.clothesSkin['glasses_1'],
			glasses_2    = LoadClothes.clothesSkin['glasses_2']
		}

		local playerPed = GetPlayerPed(-1)

		if LoadClothes.playerSkin['face'] ~= nil and LoadClothes.playerSkin['skin'] ~= nil then
			SetPedHeadBlendData(playerPed, LoadClothes.playerSkin['face'], LoadClothes.playerSkin['face'], LoadClothes.playerSkin['face'], LoadClothes.playerSkin['skin'], LoadClothes.playerSkin['skin'], LoadClothes.playerSkin['skin'], 1.0, 1.0, 1.0, true)
		end

		if LoadClothes.playerSkin['beard_1'] ~= nil and LoadClothes.playerSkin['beard_2'] ~= nil then
			SetPedHeadOverlay(playerPed,  1,  LoadClothes.playerSkin['beard_1'],  (LoadClothes.playerSkin['beard_2'] / 10) + 0.0) -- Beard
		end

		if LoadClothes.playerSkin['beard_3'] ~= nil and LoadClothes.playerSkin['beard_4'] ~= nil then
			SetPedHeadOverlayColor(playerPed,  1,  1,  LoadClothes.playerSkin['beard_3'],  LoadClothes.playerSkin['beard_4'])     -- Beard Color
		end

		if LoadClothes.playerSkin['hair_1'] ~= nil and LoadClothes.playerSkin['hair_2'] ~= nil then
			SetPedComponentVariation(playerPed, 2, LoadClothes.playerSkin['hair_1'], LoadClothes.playerSkin['hair_2'], 2)	      	-- Hair
		end

		if LoadClothes.playerSkin['hair_color_1'] ~= nil and LoadClothes.playerSkin['hair_color_2'] ~= nil then
			SetPedHairColor(playerPed, LoadClothes.playerSkin['hair_color_1'], LoadClothes.playerSkin['hair_color_2']) 		      	-- Hair Color
		end
		
		if LoadClothes.clothesSkin['tshirt_1'] ~= nil and LoadClothes.clothesSkin['tshirt_2'] ~= nil then
			SetPedComponentVariation(playerPed, 8,  LoadClothes.clothesSkin['tshirt_1'], LoadClothes.clothesSkin['tshirt_2'], 2)  -- Tshirt
		end
		if LoadClothes.clothesSkin['torso_1'] ~= nil and LoadClothes.clothesSkin['torso_2'] ~= nil then		
			SetPedComponentVariation(playerPed, 11, LoadClothes.clothesSkin['torso_1'], LoadClothes.clothesSkin['torso_2'], 2)    -- torso parts
		end

		if LoadClothes.clothesSkin['arms'] ~= nil then
			SetPedComponentVariation(playerPed, 3, LoadClothes.clothesSkin['arms'], 0, 2)                          -- torso
		end

		if LoadClothes.clothesSkin['decals_1'] ~= nil and LoadClothes.clothesSkin['decals_2'] ~= nil then
			SetPedComponentVariation(playerPed, 10, LoadClothes.clothesSkin['decals_1'], LoadClothes.clothesSkin['decals_2'], 2)  -- decals
		end

		if LoadClothes.clothesSkin['pants_1'] ~= nil and LoadClothes.clothesSkin['pants_2'] ~= nil then
			SetPedComponentVariation(playerPed, 4, LoadClothes.clothesSkin['pants_1'], LoadClothes.clothesSkin['pants_2'], 2)     -- pants
		end

		if LoadClothes.clothesSkin['shoes'] ~= nil then
			SetPedComponentVariation(playerPed, 6, LoadClothes.clothesSkin['shoes'], 0, 2) 									      -- shoes
		end

		if LoadClothes.clothesSkin['helmet_1'] ~= nil and LoadClothes.clothesSkin['helmet_2'] ~= nil then
			SetPedPropIndex(playerPed, 0, LoadClothes.clothesSkin['helmet_1'], LoadClothes.clothesSkin['helmet_2'], 2)            -- Helmet
		end

		if LoadClothes.clothesSkin['glasses_1'] ~= nil and LoadClothes.clothesSkin['glasses_2'] ~= nil then
			SetPedPropIndex(playerPed, 1, LoadClothes.clothesSkin['glasses_1'], LoadClothes.clothesSkin['glasses_2'], 2)          -- Glasses
		end

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
AddEventHandler('skinchanger:loadClothes', function(playerSkin, clothesSkin)
	
	LoadClothes = {
		playerSkin  = playerSkin,
		clothesSkin = clothesSkin
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
	
	SetPedHeadOverlay(playerPed,  1,  Character['beard_1'],  (Character['beard_2'] / 10) + 0.0)  -- Beard
	SetPedHeadOverlayColor(playerPed,  1,  1,  Character['beard_3'],  Character['beard_4'])        -- Beard Color

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
		beard_1      = GetNumHeadOverlayValues(1),
		beard_2      = 10,
		beard_3      = 63,
		beard_4      = 63,
		hair_1       = GetNumberOfPedDrawableVariations(playerPed, 2) - 1,
		hair_2       = GetNumberOfPedTextureVariations(playerPed, 2, Character['hair_1']) - 1,
		hair_color_1 = 22,
		hair_color_2 = 4,
		tshirt_1     = GetNumberOfPedDrawableVariations(playerPed, 8) - 1,
		tshirt_2     = GetNumberOfPedTextureVariations(playerPed, 8, Character['tshirt_1']) - 1,
		torso_1      = GetNumberOfPedDrawableVariations(playerPed, 11) - 1,
		torso_2      = GetNumberOfPedTextureVariations(playerPed, 11, Character['torso_1']) - 1,
		decals_1     = GetNumberOfPedDrawableVariations(playerPed, 10) - 1,
		decals_2     = GetNumberOfPedTextureVariations(playerPed, 10, Character['decals_1']) - 1,
		arms         = GetNumberOfPedDrawableVariations(playerPed, 3) - 1,
		pants_1      = GetNumberOfPedDrawableVariations(playerPed, 4) - 1,
		pants_2      = GetNumberOfPedTextureVariations(playerPed, 4, Character['pants_1']) - 1,
		shoes        = GetNumberOfPedDrawableVariations(playerPed, 6) - 1,
		helmet_1     = GetNumberOfPedPropDrawableVariations(playerPed, 0) - 1,
		helmet_2     = GetNumberOfPedTextureVariations(playerPed, 0, Character['helmet_1']) - 1,
		glasses_1    = GetNumberOfPedPropDrawableVariations(playerPed, 1) - 1,
		glasses_2    = GetNumberOfPedTextureVariations(playerPed, 1, Character['glasses_1'] - 1),
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
