print("Taxi script loaded!")

local Config = require("config")

-- Register the command to start the NPC driving
RegisterCommand("taxi", function(source, args, rawCommand)
    print("Taxi command executed!", source, args, rawCommand)
    local playerPed = PlayerId()
    local vehicleModel = "taxi"
    local spawnCoords = vector4(32.6370, -499.3062, 34.0701, 174.2523)
    local destinationCoords = vector4(1284.4242, -1516.7217, 42.7651, 219.3837)

    local npcModel

    -- Check if there's an argument
    if args[1] then
        local gender = string.lower(args[1])
        if gender == "male" then
            npcModel = Config.getRandomMaleModel()
        elseif gender == "female" then
            npcModel = Config.getRandomFemaleModel()
        elseif gender == "both" then
            npcModel = Config.getRandomModel()
        else
            -- Invalid argument, default to random
            npcModel = Config.getRandomModel()
        end
    else
        -- No argument, default to random
        npcModel = Config.getRandomModel()
    end

    -- Load vehicle model
    RequestModel(vehicleModel)
    while not HasModelLoaded(vehicleModel) do
        Wait(500)
    end

    -- Create the vehicle
    local vehicle = CreateVehicle(vehicleModel, spawnCoords.x, spawnCoords.y, spawnCoords.z, spawnCoords.w, true, false)

    -- Load NPC model
    RequestModel(npcModel)
    while not HasModelLoaded(npcModel) do
        Wait(500)
    end

    -- Create the NPC
    local npcPed = CreatePed(4, npcModel, spawnCoords.x, spawnCoords.y, spawnCoords.z, spawnCoords.w, true, false)

    -- Task the NPC to enter the vehicle as a driver
    TaskWarpPedIntoVehicle(npcPed, vehicle, -1, 0, 1, 0)
    
    -- Wait until the NPC is in the vehicle
    while not IsPedInVehicle(npcPed, vehicle, true) do
        Wait(500)
    end

    -- Set the player as the passenger without the ability to kick out the NPC
    TaskWarpPedIntoVehicle(playerPed, vehicle, -1, 1, 1, 0)

    -- Task the NPC to drive to the destination
    TaskVehicleDriveToCoord(npcPed, vehicle, destinationCoords.x, destinationCoords.y, destinationCoords.z, Config.speed, 1, vehicleModel, Config.drivingStyle, 10.0, 0)

    -- Useful functions to make the ped perform better while driving.
    SetDriverAbility(npcPed, 1.0)        -- values between 0.0 and 1.0 are allowed.
    SetDriverAggressiveness(npcPed, 0.0) -- values between 0.0 and 1.0 are allowed.

    -- Set models as no longer needed
    SetModelAsNoLongerNeeded(vehicleModel)
    SetModelAsNoLongerNeeded(npcModel)
end, false)
