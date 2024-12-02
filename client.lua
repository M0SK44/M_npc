Citizen.CreateThread(function()
    for _, npcData in pairs(Config.NPCs) do
        RequestModel(GetHashKey(npcData.model))
        while not HasModelLoaded(GetHashKey(npcData.model)) do
            Citizen.Wait(100)
        end

        local ped = CreatePed(4, GetHashKey(npcData.model), npcData.coords.x, npcData.coords.y, npcData.coords.z - 1.0,
            npcData.coords.w, false, true)

        -- Configuración del NPC
        SetEntityInvincible(ped, true)
        SetBlockingOfNonTemporaryEvents(ped, true)
        FreezeEntityPosition(ped, true)

        -- Asignar animación
        if npcData.animation then
            TaskStartScenarioInPlace(ped, npcData.animation, 0, true)
        end

        -- Mostrar texto 3D sobre el NPC
        Citizen.CreateThread(function()
            while true do
                local optimizado = 1000
                local playerCoords = GetEntityCoords(PlayerPedId())
                local npcCoords = GetEntityCoords(ped)
                local distance = #(playerCoords - npcCoords)

                -- Mostrar texto 3D si está dentro de la distancia
                if distance < Config.TextDistance then
                    Draw3DText(npcCoords.x, npcCoords.y, npcCoords.z + 1.1, npcData.displayedText, Config.TextColor)
                    optimizado = 0
                end

                -- Comprobar si el jugador está dentro de la distancia de acción
                if distance < Config.ActionDistance then
                    -- Comprobar si el jugador presiona la tecla E (38)
                    if IsControlJustPressed(0, 38) then -- 38 es el código para la tecla E
                        if npcData.actionFunction then
                            _G[npcData.actionFunction](ped)  -- Llamamos la función que esté configurada
                        end
                    end
                end

                Citizen.Wait(optimizado)
            end
        end)
    end
end)

-- Función para dibujar texto 3D
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

-- Función personalizada para el primer NPC
function npcAction1(ped)
    print("¡Estás cerca del NPC Guardaespaldas y presionaste E!")
    -- Aquí puedes agregar la lógica para el NPC1
    -- Por ejemplo, podrías hacer que el NPC diga algo o interactúe de alguna manera
end

-- Función personalizada para el segundo NPC
function npcAction2(ped)
    print("¡Estás cerca del NPC Vendedor y presionaste E!")
    -- Aquí puedes agregar la lógica para el NPC2
    -- Por ejemplo, podrías abrir un menú, vender un objeto, etc.
end
