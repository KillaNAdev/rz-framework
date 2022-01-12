local GZConfig = {
    Greenzones = {
        ["Spawn"] = {
            location = vector3(-19.36, -1824.35, 25.74),
            diameter = (30  * 3.14159), -- the maximum width of the sphere. this is also the width on ground level. Multiply this by 3.14159 to have a better looking sphere, It's not required to do that however.
            visabilitydistance = 100.0, -- the maximum distance from the circle's shell that the player is able to see. (reccomended distance is 25.0).
            color = {r = 255, g = 0, b = 0, a = 20}, -- The color of the zone's sphere (set a to equal 0 to be transparent).
            restrictions = {
                blockattack = true, -- disables any type of attack and weapon usage.
                speedlimit  = nil, -- NOTE: Measurement is in MP/H. Change to a speed if enabled. Else change to nil to disable.
            },
         
            customrestrictions = {
                enabled = true,
                loop = true,
                run = function(zone) end, stop = function(zone) end, 
            },
        },
            ["Ffa"] = {
                location = vector3(-2175.542, 6287.413, 434.205),
                diameter = (5 * 3.14159), -- the maximum width of the sphere. this is also the width on ground level. Multiply this by 3.14159 to have a better looking sphere, It's not required to do that however.
                visabilitydistance = 100.0, -- the maximum distance from the circle's shell that the player is able to see. (reccomended distance is 25.0).
                color = {r = 255, g = 0, b = 0, a = 20}, -- The color of the zone's sphere (set a to equal 0 to be transparent).
                restrictions = {
                    blockattack = true, -- disables any type of attack and weapon usage.
                    speedlimit  = nil, -- NOTE: Measurement is in MP/H. Change to a speed if enabled. Else change to nil to disable.
                },
             
                customrestrictions = {
                    enabled = true,
                    loop = false,
                    run = function(zone) end, stop = function(zone) end, 
                }, 

            },
                ["rz"] = {
                    location = vector3(1407.5122, 3079.0706, 128.5744),
                    diameter = (5 * 3.14159), -- the maximum width of the sphere. this is also the width on ground level. Multiply this by 3.14159 to have a better looking sphere, It's not required to do that however.
                    visabilitydistance = 100.0, -- the maximum distance from the circle's shell that the player is able to see. (reccomended distance is 25.0).
                    color = {r = 255, g = 0, b = 0, a = 20}, -- The color of the zone's sphere (set a to equal 0 to be transparent).
                    restrictions = {
                        blockattack = true, -- disables any type of attack and weapon usage.
                        speedlimit  = nil, -- NOTE: Measurement is in MP/H. Change to a speed if enabled. Else change to nil to disable.
                    },
                 
                    customrestrictions = {
                        enabled = false,
                        loop = true,
                        run = function(zone) end, stop = function(zone) end, 
                    }, 
                
            
        
        },
--[[
       ["MiniFFA"] = {
                location = vector3(-2175.542, 6287.413, 434.205),
                diameter = (30  * 3.14159), -- the maximum width of the sphere. this is also the width on ground level. Multiply this by 3.14159 to have a better looking sphere, It's not required to do that however.
                visabilitydistance = 100.0, -- the maximum distance from the circle's shell that the player is able to see. (reccomended distance is 25.0).
                color = {r = 255, g = 0, b = 0, a = 20}, -- The color of the zone's sphere (set a to equal 0 to be transparent).
                restrictions = {
                    blockattack = true, -- disables any type of attack and weapon usage.
                    speedlimit  = nil, -- NOTE: Measurement is in MP/H. Change to a speed if enabled. Else change to nil to disable.
                },
            },
]]--
    },
}

local inside_zone = false

local greenzones = GZConfig.Greenzones

CreateThread(function()
    while true do
        sleep = 0
        local playerPed = PlayerPedId()
        local plyCoords = GetEntityCoords(playerPed, false)
        for k, v in pairs(greenzones) do
            
            local location = v.location
            if #(plyCoords - location) < (v.diameter) - (v.diameter / 150) then
                
                if (not inside_zone) then
                    
                    local temp_append = ""
                    SetEntityCanBeDamaged(playerPed, false)
                    SetPlayerInvincibleKeepRagdollEnabled(playerPed, true)
                    SetEntityAlpha(playerPed, 150)
                    SetPlayerInvincible(playerPed, true)

                    inside_zone = true
                 
                    if (v.customrestrictions.enabled and v.customrestrictions.loop == false) then
                        SetEntityAlpha(playerPed, 150)
                        GZConfig.Greenzones[k].customrestrictions.run(v)
                  --      SetEntityAlpha(PlayerPedId(), 150)
                    end
                end
                if (v.restrictions.blockattack) then
                    SetEntityCanBeDamaged(playerPed, false)
                    SetPlayerCanDoDriveBy(playerPed, false)
                    DisablePlayerFiring(playerPed, true)
                    DisableControlAction(0, 140) -- Melee R
                    SetEntityAlpha(playerPed, 150)

                end
                if (v.restrictions.speedlimit ~= nil and tonumber(v.restrictions.speedlimit)) then
                SetEntityMaxSpeed(GetVehiclePedIsIn(playerPed, false), tonumber(v.restrictions.speedlimit) / 2.237)
              --  SetEntityAlpha(PlayerPedId(), 150)
                end
                if (v.customrestrictions.enabled and v.customrestrictions.loop == true) then
                GZConfig.Greenzones[k].customrestrictions.run(v)
           --     SetEntityAlpha(PlayerPedId(), 150)

                end
            elseif (inside_zone) then
                --trase.functions.notify("~y~You have left a greenzone")
                SetEntityCanBeDamaged(playerPed, true)
                SetEntityMaxSpeed(GetVehiclePedIsIn(playerPed, false), 99999.9)
                SetPlayerInvincibleKeepRagdollEnabled(PlayerId(), false)
                SetEntityAlpha(PlayerPedId(), 255)
                GZConfig.Greenzones[k].customrestrictions.stop(v)
                inside_zone = false
            end
        end
        Wait(sleep)
    end
end)