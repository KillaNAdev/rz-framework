fx_version 'bodacious'
game 'gta5'

author 'KillaNA'
version '1.0.0'
client_scripts {
'client/cl_main.lua',
--'client/functions.lua',
'client/events.lua',
'client/commands.lua',
'client/theads.lua',
'client/cl_greenzone.lua',
'client/death.lua',
'client/bb_c.lua'
}
shared_scripts {
    'config.lua',
    'client/cl_main.lua'
}

server_scripts {
    'server/events.lua',
    'bb_s.lua',
    'bb_config.lua'
}


 files {
    'weapons.meta',
    'ui/script.js',
    'ui/index.html',
    'ui/style.css',
}
ui_page 'ui/index.html'

 

data_file 'WEAPONINFO_FILE_PATCH' 'weapons.meta'