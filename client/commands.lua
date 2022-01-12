
function vrz.functions.notification(text, flash)
	if vrz.settings.notifications then
		BeginTextCommandThefeedPost("STRING")
		AddTextComponentSubstringPlayerName(text)
		EndTextCommandThefeedPostTicker(flash or false, true)
	end
end
RegisterCommand('h', function() 
    if not IsEntityDead(PlayerPedId()) then
        if vrz.settings.healthCooldown == 5 then
            local currentHealth = GetEntityHealth(PlayerPedId())

            local healthCapacity = GetEntityMaxHealth(PlayerPedId())

            if currentHealth < healthCapacity then
                SetEntityHealth(PlayerPedId(), healthCapacity)

                vrz.functions.notification('~g~Healed.')

                vrz.functions.notification('~w~Please wait ~y~'..vrz.settings.healthCooldown..' ~w~seconds before healing again.', true)

                while vrz.settings.healthCooldown > 0 do 
                    vrz.settings.healthCooldown = vrz.settings.healthCooldown - 1
                    Citizen.Wait(1000)
                end

                vrz.settings.healthCooldown = 7
            else
                vrz.functions.notification('~r~Your health is already full.')
            end   
        end
    else
        vrz.functions.notification('~r~You cannot do this while dead.')
    end
end)

RegisterCommand('a', function()
    if not IsEntityDead(PlayerPedId()) then
        if vrz.settings.armorCooldown == 5 then
            local currentArmor = GetPedArmour(PlayerPedId())

            local armorCapacity = 100

            if currentArmor < armorCapacity then
                SetPedArmour(PlayerPedId(), armorCapacity)

                vrz.functions.notification('~b~Armor Applied.')

                vrz.functions.notification('~w~Please wait ~y~'..vrz.settings.armorCooldown..' ~w~seconds before applying armor again.', true)
                
                while vrz.settings.armorCooldown > 0 do 
                    vrz.settings.armorCooldown = vrz.settings.armorCooldown - 1
                    Citizen.Wait(1000)
                end

                vrz.settings.armorCooldown = 5
            else
                vrz.functions.notification('~r~Your armor is already full.')
            end
        end
    else
        vrz.functions.notification('~r~You cannot do this while dead.')
    end



  


end)
RegisterCommand('die', function()
    SetEntityHealth(PlayerPedId(), 0)
end)

RegisterCommand( "dv", function()
    TriggerEvent( "wk:deleteVehicle" )
end, false )
TriggerEvent( "chat:addSuggestion", "/dv", "Deletes the vehicle you're sat in, or standing next to." )

-- The distance to check in front of the player for a vehicle   
local distanceToCheck = 5.0

-- The number of times to retry deleting a vehicle if it fails the first time 
local numRetries = 5

-- Add an event handler for the deleteVehicle event. Gets called when a user types in /dv in chat
RegisterNetEvent( "wk:deleteVehicle" )
AddEventHandler( "wk:deleteVehicle", function()
    local ped = GetPlayerPed( -1 )

    if ( DoesEntityExist( ped ) and not IsEntityDead( ped ) ) then 
        local pos = GetEntityCoords( ped )

        if ( IsPedSittingInAnyVehicle( ped ) ) then 
            local vehicle = GetVehiclePedIsIn( ped, false )

            if ( GetPedInVehicleSeat( vehicle, -1 ) == ped ) then 
                DeleteGivenVehicle( vehicle, numRetries )
            else 
                vrz.functions.notification( "You must be in the driver's seat!" )
            end 
        else
            local inFrontOfPlayer = GetOffsetFromEntityInWorldCoords( ped, 0.0, distanceToCheck, 0.0 )
            local vehicle = GetVehicleInDirection( ped, pos, inFrontOfPlayer )

            if ( DoesEntityExist( vehicle ) ) then 
                DeleteGivenVehicle( vehicle, numRetries )
            else 
                vrz.functions.notification( "~y~You must be in or near a vehicle to delete it." )
            end 
        end 
    end 
end )

function DeleteGivenVehicle( veh, timeoutMax )
    local timeout = 0 

    SetEntityAsMissionEntity( veh, true, true )
    DeleteVehicle( veh )

    if ( DoesEntityExist( veh ) ) then
        vrz.functions.notification( "~r~Failed to delete vehicle, trying again..." )

        -- Fallback if the vehicle doesn't get deleted
        while ( DoesEntityExist( veh ) and timeout < timeoutMax ) do 
            DeleteVehicle( veh )

            -- The vehicle has been banished from the face of the Earth!
            if ( not DoesEntityExist( veh ) ) then 
                vrz.functions.notification( "~g~Vehicle deleted." )
            end 

            -- Increase the timeout counter and make the system wait
            timeout = timeout + 1 
            Citizen.Wait( 500 )

            -- We've timed out and the vehicle still hasn't been deleted. 
            if ( DoesEntityExist( veh ) and ( timeout == timeoutMax - 1 ) ) then
                vrz.functions.notification( "~r~Failed to delete vehicle after " .. timeoutMax .. " retries." )
            end 
        end 
    else 
        vrz.functions.notification( "~g~Vehicle deleted." )
    end 
end 

-- Gets a vehicle in a certain direction
-- Credit to Konijima
function GetVehicleInDirection( entFrom, coordFrom, coordTo )
	local rayHandle = StartShapeTestCapsule( coordFrom.x, coordFrom.y, coordFrom.z, coordTo.x, coordTo.y, coordTo.z, 5.0, 10, entFrom, 7 )
    local _, _, _, _, vehicle = GetShapeTestResult( rayHandle )
    
    if ( IsEntityAVehicle( vehicle ) ) then 
        return vehicle
    end 
end



RegisterKeyMapping('h', 'Apply health.', 'keyboard', 'i')
RegisterKeyMapping('a', 'Apply armor.', 'keyboard', 'O')
RegisterKeyMapping('die', 'Commit suicide.', 'keyboard', 'PAGEUP')
RegisterKeyMapping('ap', 'Spawn AP Pistol.', 'keyboard', 'DELETE')

RegisterKeyMapping('tx', 'Admin Menu.', 'keyboard', 'F9')
