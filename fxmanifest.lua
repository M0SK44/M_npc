
fx_version 'adamant'
games { 'gta5' }

client_scripts {
	'config.lua',
	'client.lua',
}

server_scripts {
    '@mysql-async/lib/MySQL.lua',
    'server.lua'
}

shared_script '@es_extended/imports.lua'server_scripts { '@mysql-async/lib/MySQL.lua' }