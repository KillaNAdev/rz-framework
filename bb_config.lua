Config = {}

local Prefix = "[Zero RZ Queue] "
Config.DiscordServerID = 917502722545188894 -- Discord Server ID
Config.DiscordBotToken = "NOTOKENFORULOL" -- Discord Bot Token. You can create one on https://discord.com/developers/applications
Config.ApiLink = "" -- API Stuff
Config.ApiKey = ""-- API Stuff
Config.maxServerSlots = 50

Config.Roles = {
	fivepiro = {
		roleID = "926295516315263047",
		points = 500,
		name = "500 Priority"
	},

	one = {
		roleID = "926295516315263047",
		points = 1000,
		name = "1K Priority"
	},
	wne = {
		roleID = "926295517791674368",
		points = 2000,
		name = "2K Priority"
	},


	wwwne = {
		roleID = "926295518605348884",
		points = 5000,
		name = "5K Priority"
	},

	awne = {
		roleID = "926295520375357470",
		points = 20000,
		name = "20K Priority"
	},

	staff = {
		roleID = "926295502679572550",
		points = 500,
		name = "Staff Priority"
	},

	contentcreator = {
		roleID = "926295495465381908",
		points = 5000,
		name = "Content Creator Priority"
	},

	Booster = {
		roleID = "918253925499547679",
		points = 15,
		name = "Booster Priority"
	},

	mangment = {
		roleID = "926295494723010670",
		points = 90000000000000,
		name = "Managment Priority"
	},
}

Config.Colors = {
	"accent",
	"good",
	"warning",
	"attention",
}

Config.Verifiying = Prefix .. "Please wait, Downloading content from Zero RZ database."
Config.VerifiyingLauncher = Prefix .. "Please wait, Verifiying you entered through the launcher."
Config.VerifiyingDiscord = Prefix .. "Please wait, Verifiying your Discord ID."
Config.VerifiyingSteam = Prefix .. "Please wait, Verifiying your Steam."
Config.VerifiyingQueue = Prefix .. "Please wait, Adding you to the queue."

Config.NotWhitelisted = Prefix .. "Sorry, I didn't find you in our database."
Config.NoDiscord = Prefix .. "Please make sure your Discord is open."
Config.NoSteam = Prefix .. "Please make sure your Steam is open."
Config.NoLauncher = Prefix .. "The server can only be accessed through its launcher."
Config.Blacklisted = Prefix .. "You're blacklisted from the server, fuck off please."

Config.Welcome = Prefix .. "Welcome Sir."
Config.Error = Prefix .. "Error, Please try again later."
Config.HandshakingWith = Prefix .. "Handshaking With Zero RZ Queue."
