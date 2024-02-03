fx_version 'cerulean'
game 'gta5'

author 'Wqual Development'
discord 'https://discord.gg/UG2dtyjBGA'
description 'Wqual Farmer Job'
version '1.0'

lua54 'yes'

shared_scripts {
    '@ox_lib/init.lua',
    'shared/config.lua',
}

client_scripts {
    'client/main.lua',
    'client/raccolta.lua',
    'client/mungitura.lua',
    'client/fieno.lua',
    'client/vendita.lua'
}

server_scripts {
    'server/main.lua'
}