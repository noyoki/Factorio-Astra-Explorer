AstraFunctions = {}

AstraFunctions.Print = function(text)
    game.print(text)
end

AstraFunctions.CreatePlatform = function(location)
    local platform = game.forces.player.create_space_platform { planet = "the-void", starter_pack = "space-platform-starter-pack" }
    platform.apply_starter_pack()
    platform.hub.insert({ name = "crusher", count = 6 })
    platform.hub.insert({ name = "asteroid-collector", count = 6 })
    platform.hub.insert({ name = "assembling-machine-1", count = 10 })
    platform.hub.insert({ name = "inserter", count = 30 })
    platform.hub.insert({ name = "solar-panel", count = 20 })
    platform.hub.insert({ name = "space-platform-foundation", count = 800 })
    platform.hub.insert({ name = "electric-furnace", count = 10 })
    platform.hub.insert({ name = "transport-belt", count = 100 })
    platform.space_location = location

    platform.surface.set_tiles({ { position = { 0, 0 }, name = "space-platform-foundation" } })
    platform.surface.set_tiles({ { position = { 0, 1 }, name = "space-platform-foundation" } })
    platform.surface.set_tiles({ { position = { 0, 2 }, name = "space-platform-foundation" } })
    platform.surface.set_tiles({ { position = { 0, 3 }, name = "space-platform-foundation" } })
    platform.surface.set_tiles({ { position = { 0, 4 }, name = "space-platform-foundation" } })
    platform.surface.set_tiles({ { position = { 0, 5 }, name = "space-platform-foundation" } })
    platform.surface.set_tiles({ { position = { 0, 6 }, name = "space-platform-foundation" } })
    platform.surface.set_tiles({ { position = { 0, 7 }, name = "space-platform-foundation" } })
    platform.surface.set_tiles({ { position = { 0, 8 }, name = "space-platform-foundation" } })
    platform.surface.set_tiles({ { position = { 0, 9 }, name = "space-platform-foundation" } })

    return platform
end