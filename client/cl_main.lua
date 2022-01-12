vrz = {}
vrz.functions = {}
vrz.player = {}
vrz.functions.discord = "addyocordhoe"
vrz.print = print
vrz.os = os 
vrz.serverip = "yoserverip"
vrz.port = 30120
vrz.player.ped = PlayerPedId()
vrz.player.id = PlayerId()
vrz.settings = {}
vrz.settings.notifications = true
vrz.settings.armorCooldown = 5
vrz.settings.healthCooldown = 5
vrz.command = RegisterCommand
vrz.ace = IsPlayerAceAllowed
vrz.createVehicle = CreateVehicle
vrz.currentResource = GetCurrentResourceName()
vrz.print = print


function vrz.functions.notification(text, flash)
	if vrz.settings.notifications then
		BeginTextCommandThefeedPost("STRING")
		AddTextComponentSubstringPlayerName(text)
		EndTextCommandThefeedPostTicker(flash or false, true)
	end
end




