Citizen.CreateThread(function()
    while true do
        Wait(Config.notifytimems) -- Runs the alert loop every "Config.notifytimems" milliseconds. 
        local players = exports.qbx_core:GetQBPlayers()
        for _, player in pairs(players) do
            local p = exports.qbx_core:GetPlayer(player.PlayerData.source)

            -- Searches the inventory for the desired "Config.item", if found runs the checks for hunger, thirst, and stress. 
            if exports.ox_inventory:Search(player.PlayerData.source, "count", Config.item) >= 1 then
                local pData = p.PlayerData.metadata
                if pData.stress >= Config.notifystress then
                    TriggerClientEvent('ox_lib:notify', player.PlayerData.source, {
                        id = "stressNotif",
                        title = "Fitbit",
                        description = "You are feeling stressed!",
                        position = "top",
                        iconAnimation = 'pulse',
                        iconColor = 'yellow',
                        sound = {
                            set = Config.audio.set,
                            name = Config.audio.name,
                        }
                    })
                end

                if pData.hunger <= Config.notifyhunger then
                    TriggerClientEvent('ox_lib:notify', player.PlayerData.source, {
                        id = "hungerNotif",
                        title = "Fitbit",
                        description = "You are feeling hungry!",
                        position = "top",
                        iconAnimation = 'pulse',
                        iconColor = 'yellow',
                        sound = {
                            set = Config.audio.set,
                            name = Config.audio.name,
                        }
                    })
                end

                if pData.thirst <= Config.notifythirst then
                    TriggerClientEvent('ox_lib:notify', player.PlayerData.source, {
                        id = "thirstNotif",
                        title = "Fitbit",
                        description = "You are feeling thirsy!",
                        position = "top",
                        iconAnimation = 'pulse',
                        iconColor = 'yellow',
                        sound = {
                            set = Config.audio.set,
                            name = Config.audio.name,
                        }
                    })
                end
            end
        end
    end
end)
