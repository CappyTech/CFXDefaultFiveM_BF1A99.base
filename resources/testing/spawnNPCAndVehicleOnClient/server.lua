-- spawnNPCAndVehicleOnClient/server.lua

RegisterNetEvent("spawnNPCAndVehicleOnClient")

function ChooseRandomPlayer()
    local players = GetPlayers()

    if #players > 0 then
        local randomIndex = math.random(1, #players)
        return players[randomIndex]
    end

    return nil
end

function GetPlayerNameById(playerId)
    local playerName = "Unknown"
    for _, id in ipairs(GetPlayers()) do
        if id == playerId then
            playerName = GetPlayerName(id)
            break
        end
    end
    return playerName
end

function spawnNPCAndVehicleForRandomPlayer()
    local randomPlayerId = ChooseRandomPlayer()

    if randomPlayerId then
        local playerName = GetPlayerNameById(randomPlayerId)
        local vehicleModel = "adder"
        local npcModel = "a_f_m_bevhills_01"
        local spawnCoords = vector4(32.6370, -499.3062, 34.0701, 174.2523)
        local destinationCoords = vector4(1284.4242, -1516.7217, 42.7651, 219.3837)

        -- Send a request to the client to load the models and spawn NPC and vehicle
        TriggerClientEvent("spawnNPCAndVehicleOnClient", randomPlayerId, vehicleModel, npcModel, spawnCoords, destinationCoords)

        -- Send a chat message to the server
        TriggerClientEvent("chatMessage", -1, "SYSTEM", {255, 255, 255}, playerName .. " spawned an NPC and vehicle.")
    end
end

function spawnNPCAndVehicleForPlayer(playerId)
    local playerName = playerId
    local vehicleModel = "adder"
    local npcModel = "a_f_m_bevhills_01"
    local spawnCoords = vector4(32.6370, -499.3062, 34.0701, 174.2523)
    local destinationCoords = vector4(1284.4242, -1516.7217, 42.7651, 219.3837)

    -- Send a request to the client to load the models and spawn NPC and vehicle
    TriggerEvent("spawnNPCAndVehicleOnClient", playerId, vehicleModel, npcModel, spawnCoords, destinationCoords)

    -- Send a chat message from the server
    TriggerEvent("chatMessage", "Spawned an NPC and vehicle.")
end

-- Call the function to spawn NPC and vehicle for a random player
--spawnNPCAndVehicleForRandomPlayer()

RegisterCommand("drive", function(source, args, rawCommand)
    local playerId = source
    spawnNPCAndVehicleForPlayer(playerId)
end, false)

RegisterCommand("getid", function(source, args, rawCommand)
    local playerId = source
    TriggerEvent("chatMessage", playerId, "server", "Your player ID is: " .. playerId)
end, false)