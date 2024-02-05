-- spawnModelOnClient/client.lua

RegisterNetEvent("spawnModelOnClient")

-- Function to spawn a model at specified coordinates
function spawnModelOnClient(modelHash, x, y, z, heading)
    Citizen.Trace("Received spawnModelOnClient event. Spawning model.")

    local vehicle = CreateVehicle(modelHash, x, y, z, heading, true, false)

    Citizen.Trace("Model spawned successfully.")
end

-- Event handler for spawning a model on the client
AddEventHandler("spawnModelOnClient", function(modelHash, x, y, z, heading)
    spawnModelOnClient(modelHash, x, y, z, heading)
end)
