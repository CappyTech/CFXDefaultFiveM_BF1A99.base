fx_version 'cerulean'
game 'gta5'

author 'Jacobmaate'
description 'San Andreas Highway Patrol (SAHP) Pack'
version 'v1.01'

files {
    'data/vehicles.meta',
	'data/carvariations.meta',
	'data/carcols.meta',
	'data/handling.meta',
	'data/jmsahp_game.dat151.rel',
	'data/jmsahp_sounds.dat54.rel',
}

data_file 'HANDLING_FILE' 'data/handling.meta'
data_file 'VEHICLE_METADATA_FILE' 'data/vehicles.meta'
data_file 'CARCOLS_FILE' 'data/carcols.meta'
data_file 'VEHICLE_VARIATION_FILE' 'data/carvariations.meta'
data_file 'AUDIO_GAMEDATA' 'data/jmsahp_game.dat'
data_file 'AUDIO_SOUNDDATA' 'data/jmsahp_sounds.dat'
client_script 'vehicle_names.lua'