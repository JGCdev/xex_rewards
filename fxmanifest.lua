fx_version 'adamant'

game 'gta5'

lua54 'on'

description 'Xex Rewards - Reward new players'

version '1.0.0'

ui_page "nui/index.html"

files{
	"nui/*.html",
	"nui/ui.js",
	"nui/css/style.css",
	"nui/assets/*.png",
}

server_scripts {
	'@async/async.lua',
	'@mysql-async/lib/MySQL.lua',
	'@es_extended/locale.lua',
	'config.lua',
	'server/main-s.lua',
	'locales/*.lua',
}

client_scripts {
	'@es_extended/locale.lua',
	'config.lua',
	'client/main-c.lua',
	'locales/*.lua',
}

dependencies {
	'es_extended',
	'esx_vehicleshop'
}

escrow_ignore {
	'*',
	'client/*',
	'server/*',
	'nui/*'
}
