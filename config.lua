Config = {}

Config.TextDistance = 5.0 -- Distancia para mostrar el texto 3D
Config.ActionDistance = 2.0 -- Distancia para ejecutar la acción (puede ser personalizada)

Config.TextColor = {r = 0, g = 255, b = 203, a = 255} -- Color del texto 3D

Config.NPCs = {
    {
        model = "g_m_y_mexgang_01",
        coords = vector4(102.2021, -1392.099, 29.40166, 119.5547),
        animation = "WORLD_HUMAN_AA_COFFEE",
        displayedText = "Guardaespaldas",
        actionFunction = "npcAction1"  -- Función personalizada para este NPC
    },
    {
        model = "a_m_y_hipster_01",
        coords = vector4(105.1624, -1394.407, 29.4152, 101.652),
        animation = "WORLD_HUMAN_BUM_FREEWAY",
        displayedText = "Mendigo",
        actionFunction = "npcAction2"  -- Función personalizada para otro NPC
    },
    -- Puedes agregar más NPCs aquí...
}
