fx_version 'cerulean'
game 'gta5'

author 'Jacobmaate'
description 'NOOSE Multi-Agency Pack'
version 'v1.04'

files {
    'data/vehicles.meta',
	'data/carvariations.meta',
	'data/carcols.meta',
	'data/handling.meta',
	'data/jmnoose_game.dat151.rel',
}

data_file 'HANDLING_FILE' 'data/handling.meta'
data_file 'VEHICLE_METADATA_FILE' 'data/vehicles.meta'
data_file 'CARCOLS_FILE' 'data/carcols.meta'
data_file 'VEHICLE_VARIATION_FILE' 'data/carvariations.meta'
data_file 'AUDIO_GAMEDATA' 'data/jmnoose_game.dat'
client_script 'vehicle_names.lua'