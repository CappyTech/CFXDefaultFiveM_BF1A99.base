-- spawnNPCAndVehicleOnClient/client.lua

RegisterNetEvent("spawnNPCAndVehicleOnClient")

function getModel(modelName)
    local modelHash = GetHashKey(modelName)
    RequestModel(modelHash)

    while not HasModelLoaded(modelHash) do
        Wait(500)
    end

    return modelHash
end

AddEventHandler("spawnNPCAndVehicleOnClient", function(vehicleModel, npcModel, spawnCoords, destinationCoords)
    local vehicleHash = getModel(vehicleModel)
    local npcHash = getModel(npcModel)

    local vehicle = CreateVehicle(vehicleHash, spawnCoords.x, spawnCoords.y, spawnCoords.z, spawnCoords.w, true, false)
    SetModelAsNoLongerNeeded(vehicleHash)

    local ped = PlayerPedId()

    RequestModel(npcHash)

    while not HasModelLoaded(npcHash) do
        Wait(1000)
    end

    local npc = CreatePed(4, npcHash, spawnCoords.x, spawnCoords.y, spawnCoords.z, 0.0, true, false)
    SetModelAsNoLongerNeeded(npcHash)

    TaskWarpPedIntoVehicle(npc, vehicle, -1)
    TaskEnterVehicle(ped, vehicle, 3000, 2, 1.0, 1, 0)
    TaskVehicleDriveToCoordLongrange(npc, vehicle, destinationCoords.x, destinationCoords.y, destinationCoords.z, 20.0, 537658303, 8.0)

    TriggerClientEvent("chat:addMessage", "Spawned an NPC and vehicle for you")
end)