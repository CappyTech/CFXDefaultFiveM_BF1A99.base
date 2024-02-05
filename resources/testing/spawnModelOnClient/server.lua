-- spawnModelOnClient/server.lua

RegisterNetEvent("spawnModelOnClient")

-- Function to request and load a model
function getModel(modelName)
    local modelHash = GetHashKey(modelName)
    RequestModel(modelHash)

    while not HasModelLoaded(modelHash) do
        Wait(500)
    end

    Citizen.Trace("Model loaded successfully: " .. modelName .. ", hash: " .. modelHash)

    return modelHash
end

-- Function to spawn a model at specified coordinates on the client
function spawnModelOnClient(playerId, modelName, x, y, z, heading)
    Citizen.Trace("Received spawnModelOnClient event. Attempting to spawn model: " .. modelName)

    local modelHash = getModel(modelName)

    -- Check if the model was successfully loaded
    if modelHash ~= 0 then
        -- Trigger the client-side function to spawn the model
        TriggerClientEvent("spawnModelOnClient", playerId, modelHash, x, y, z, heading)
        Citizen.Trace("Model spawn request sent to the client.")
    else
        Citizen.Trace("Error loading model: " .. modelName .. ", with hash: " .. modelHash)
    end
end

-- Command to spawn a model on the server
RegisterCommand("spawnmodel", function(source, args, rawCommand)
    local playerId = source
    local modelName = args[1] or "adder" -- Default to "adder" if no model name is provided
    local x, y, z = table.unpack(GetEntityCoords(GetPlayerPed(playerId)))
    local heading = GetEntityHeading(GetPlayerPed(playerId))

    spawnModelOnClient(playerId, modelName, x, y, z, heading)
end, false)
