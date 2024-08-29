fx_version 'cerulean'
game 'gta5'
lua54 'yes'

server_scripts { 
   'server/server.lua',
}
 client_scripts {
    'client/client.lua',
    "@qbx_core/modules/playerdata.lua",
 }

 shared_scripts {
   'config.lua',
   '@ox_lib/init.lua',
   "@qbx_core/modules/lib.lua"


 }