fx_version 'cerulean'
game 'gta5'

description '11john11_bcsd_pack' 
version '1.0.230'

this_is_a_map 'yes'

files {
    		
	'vehicleweapon_bcheli.meta',
	'vehiclelayouts_squaddie.meta',
	'vehiclelayouts_buf4.meta',
	'vehicles.meta',
   	'carcols.meta',
	'carvariations.meta',
	'peds.meta',
   	'handling.meta',   
   	'dlctext.meta',
	'audio/bcsdpack_game.dat151.rel',
}
data_file 'WEAPONINFO_FILE' 'vehicleweapon_bcheli.meta'
data_file 'VEHICLE_LAYOUTS_FILE' 'vehiclelayouts_squaddie.meta'
data_file 'VEHICLE_LAYOUTS_FILE' 'vehiclelayouts_buf4.meta'
data_file 'VEHICLE_METADATA_FILE' 'vehicles.meta'
data_file 'CARCOLS_FILE' 'carcols.meta'
data_file 'VEHICLE_VARIATION_FILE' 'carvariations.meta'
data_file 'PED_METADATA_FILE' 'peds.meta'
data_file 'HANDLING_FILE' 'handling.meta'
data_file 'AUDIO_GAMEDATA' 'audio/bcsdpack_game.dat'

client_script 'vehicle_names.lua'
