-- Unstuck Command Script for FiveM

-- Register the 'unstuck' command
RegisterCommand("unstuck", function(source, args, rawCommand)
    -- Get the player's ped (character)
    local playerPed = PlayerPedId()

    -- Check if the player exists
    if playerPed then
        -- Get the player's current position
        local x, y, z = table.unpack(GetEntityCoords(playerPed, true))

        -- Define an offset for the unstuck teleport (e.g., 5 meters in front)
        local forwardOffset = 5.0

        -- Get the direction the player is facing
        local heading = GetEntityHeading(playerPed)
        local radians = math.rad(heading)

        -- Calculate new coordinates based on player's current heading
        local newX = x + (forwardOffset * math.sin(radians))
        local newY = y + (forwardOffset * math.cos(radians))

        -- Teleport the player to the new position
        SetEntityCoords(playerPed, newX, newY, z, false, false, false, true)

        -- Notify the player they've been unstuck
        TriggerEvent('chat:addMessage', {
            color = {255, 0, 0},
            multiline = true,
            args = {"[Unstuck]", "You have been teleported forward!"}
        })
    end
end, false) -- false means the command is not restricted to admins
