Citizen.CreateThread(function()
    for _, npcData in pairs(Config.NPCs) do
        -- Request the NPC model
        RequestModel(GetHashKey(npcData.model))
        while not HasModelLoaded(GetHashKey(npcData.model)) do
            Citizen.Wait(100)
        end

        -- Create the NPC at the specified coordinates
        local ped = CreatePed(4, GetHashKey(npcData.model), npcData.coords.x, npcData.coords.y, npcData.coords.z - 1.0,
            npcData.coords.w, false, true)

        -- NPC Configuration
        SetEntityInvincible(ped, true)
        SetBlockingOfNonTemporaryEvents(ped, true)
        FreezeEntityPosition(ped, true)

        -- Assign animation
        if npcData.animation then
            TaskStartScenarioInPlace(ped, npcData.animation, 0, true)
        end

        -- Display 3D text above the NPC
        Citizen.CreateThread(function()
            while true do
                local optimized = 1000
                local playerCoords = GetEntityCoords(PlayerPedId())
                local npcCoords = GetEntityCoords(ped)
                local distance = #(playerCoords - npcCoords)

                -- Show 3D text if within distance
                if distance < Config.TextDistance then
                    Draw3DText(npcCoords.x, npcCoords.y, npcCoords.z + 1.1, npcData.displayedText, Config.TextColor)
                    optimized = 0
                end

                -- Check if the player is within action distance
                if distance < Config.ActionDistance then
                    -- Check if the player presses the E key (38)
                    if IsControlJustPressed(0, 38) then -- 38 is the code for the E key
                        if npcData.actionFunction then
                            _G[npcData.actionFunction](ped) -- Call the configured function
                        end
                    end
                end

                Citizen.Wait(optimized)
            end
        end)
    end
end)

-- Function to draw 3D text
function Draw3DText(x, y, z, text, color)
    local onScreen, _x, _y = World3dToScreen2d(x, y, z)
    local camCoords = GetGameplayCamCoords()
    local distance = #(vector3(x, y, z) - camCoords)

    local scale = (1 / distance) * 2
    local fov = (1 / GetGameplayCamFov()) * 100
    scale = scale * fov

    if onScreen then
        SetTextScale(0.0 * scale, 0.5 * scale)
        SetTextFont(0)
        SetTextProportional(1)
        SetTextColour(color.r, color.g, color.b, color.a)
        SetTextDropshadow(0, 0, 0, 0, 255)
        SetTextEdge(2, 0, 0, 0, 150)
        SetTextDropShadow()
        SetTextOutline()
        SetTextCentre(1)

        BeginTextCommandDisplayText("STRING")
        AddTextComponentSubstringPlayerName(text)
        EndTextCommandDisplayText(_x, _y)
    end
end

-- Custom function for the first NPC
function npcAction1(ped)
    print("You are near the Bodyguard NPC and pressed E!")
    -- Add logic for NPC1 here
    -- For example, the NPC could say something or interact in some way
end

-- Custom function for the second NPC
function npcAction2(ped)
    print("You are near the Vendor NPC and pressed E!")
    -- Add logic for NPC2 here
    -- For example, open a menu, sell an item, etc.
end

-- Function that does nothing
function nothing(ped)
    -- No action is performed
end
