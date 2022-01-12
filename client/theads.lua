
CreateThread(function() -- nO pOLICE
  DisplayRadar(false)
--TriggerServerEvent('getcharacterclothes')
	StatSetInt('MP0_STAMINA', 100, true)
	StatSetInt('MP0_STRENGTH', 100, true)
	StatSetInt('MP0_LUNG_CAPACITY', 100, true)
	StatSetInt('MP0_WHEELIE_ABILITY', 100, true)
	StatSetInt('MP0_FLYING_ABILITY', 100, true)
	StatSetInt('MP0_SHOOTING_ABILITY', 100, true)
	StatSetInt('MP0_STEALTH_ABILITY', 100, true)
	while true do
		Citizen.Wait(0)

       
     SetRainLevel(0.0)
	end
end)
CreateThread(function()
	while true do
		Citizen.Wait(0) -- prevent crashing

    
		if GetPlayerWantedLevel(PlayerId()) ~= 0 then
            SetPlayerWantedLevel(PlayerId(), 0, false)
            SetPlayerWantedLevelNow(PlayerId(), false)
        end
	
	end
end)





CreateThread( function()
	while true do
	  Citizen.Wait(1000)
	  RestorePlayerStamina(PlayerId(), 1.0)
  
	end
  end)

 -- ReplaceHudColourWithRgba(12 3, 116, 9, 102, 0.979)

 CreateThread(function()
    while true do
        local playerCount = #GetActivePlayers()
        local id = PlayerId()
        local name = GetPlayerName(id)
        local serverid = GetPlayerServerId(id)
        SetDiscordAppId(926350260849213471)
        SetDiscordRichPresenceAsset('image0_1')
        if name ~= nil and serverid ~= nil then
            SetDiscordRichPresenceAssetText(name.." | ID: "..serverid) 
        end
        SetDiscordRichPresenceAssetSmallText('discord.gg/zerorz') 
        if playerCount ~= nil then
            SetRichPresence(playerCount.."/50 Players | discord.gg/zerorz")
        end
      --  AddTextEntry('FE_THDR_GTAO', name..' ~o~|~w~ ID: '..id..' ~o~|~w~ Zero RZ ~o~| ~w~Discord.gg/zerorz')
        SetDiscordRichPresenceAction(0, "Discord", "https://discord.gg/zerorz")
        Citizen.Wait(30 * 1000)
	end
end)

for i = 0, 3 do
    StatSetInt(GetHashKey("mp" .. i .. "_shooting_ability"), 100, true)
    StatSetInt(GetHashKey("sp" .. i .. "_shooting_ability"), 100, true)
  end


  RegisterNetEvent("logo:display")
  AddEventHandler(
    "logo:display",
    function(value)
      SendNUIMessage(
        {
          type = "logo",
          display = value,
        }
      )
    end
  )

  CreateThread(
    function()
      Citizen.Wait(5000)
      local display = true
      TriggerEvent("logo:display", true)
    end
  )
  
  CreateThread(function()
  
  end)