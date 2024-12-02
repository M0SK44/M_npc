Config = {}

Config.TextDistance = 5.0 -- Distance to display the 3D text
Config.ActionDistance = 2.0 -- Distance to execute the action (can be customized)

Config.TextColor = {r = 0, g = 255, b = 203, a = 255} -- Color of the 3D text

Config.NPCs = {
    {
        model = "g_m_y_mexgang_01", --Model https://docs.fivem.net/docs/game-references/ped-models/
        coords = vector4(-1725.755, -983.5642, 5.779106, 328.2054), --Coords v4
        animation = "WORLD_HUMAN_AA_COFFEE", --Animations https://wiki.rage.mp/index.php?title=Scenarios
        displayedText = "Bodyguard", --3D Text
        actionFunction = "npcAction1"  -- Custom function for this NPC
    },
    {
        model = "a_m_y_hipster_01",
        coords = vector4(-1727.406, -982.1024, 5.835865, 310.0778),
        animation = "WORLD_HUMAN_BUM_FREEWAY",
        displayedText = "Beggar",
        actionFunction = "npcAction2"  -- Custom function for another NPC
    }, 

    {
        model = "a_c_chop",
        coords = vector4(-1729.321, -979.2773, 5.979335, 258.7805),
        animation = "",
        displayedText = "Dog",
        actionFunction = "nothing"  -- Custom function for another NPC
    }, 

    {
        model = "a_c_hen",
        coords = vector4(-1728.259, -980.5356, 5.920881, 314.8914),
        animation = "",
        displayedText = "Chicken",
        actionFunction = "nothing"  -- Custom function for another NPC
    },
    -- You can add more NPCs here...
}
