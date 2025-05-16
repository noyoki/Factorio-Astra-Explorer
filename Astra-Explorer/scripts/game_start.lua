

local function StartGame()

    local force = game.forces.player
    force.unlock_space_platforms()
    force.unlock_space_location("shattered-tanker")

    local platform = force.create_space_platform { name = "home", planet = "nauvis", starter_pack = "space-platform-starter-pack" }
    platform.apply_starter_pack()
    storage.platform = platform
    platform.hub.insert({ name = "crusher", count = 6 })
    platform.hub.insert({ name = "asteroid-collector", count = 6 })
    platform.hub.insert({ name = "assembling-machine-1", count = 10 })
    platform.hub.insert({ name = "inserter", count = 30 })
    platform.hub.insert({ name = "solar-panel", count = 20 })
    platform.hub.insert({ name = "space-platform-foundation", count = 800 })
    platform.hub.insert({ name = "electric-furnace", count = 10 })
    platform.hub.insert({ name = "transport-belt", count = 100 })
    platform.space_location = "shattered-tanker"
    force.lock_space_location("nauvis")

    if remote.interfaces.freeplay then
            if remote.interfaces.freeplay.set_disable_crashsite then
                remote.call("freeplay", "set_disable_crashsite", true)
                remote.call("freeplay", "set_skip_intro", true)
            end
        end

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
    platform.surface.set_tiles({ { position = { 0, 10 }, name = "space-platform-foundation" } })
    platform.surface.set_tiles({ { position = { 0, 11 }, name = "space-platform-foundation" } })
    platform.surface.set_tiles({ { position = { 0, 12 }, name = "space-platform-foundation" } })
    platform.surface.set_tiles({ { position = { 0, 13 }, name = "space-platform-foundation" } })
    platform.surface.set_tiles({ { position = { 0, 14 }, name = "space-platform-foundation" } })
    platform.surface.set_tiles({ { position = { 0, 15 }, name = "space-platform-foundation" } })
    platform.surface.set_tiles({ { position = { 0, 16 }, name = "space-platform-foundation" } })
    platform.surface.set_tiles({ { position = { 0, 17 }, name = "space-platform-foundation" } })
    platform.surface.set_tiles({ { position = { 0, 18 }, name = "space-platform-foundation" } })
    platform.surface.set_tiles({ { position = { 0, 19 }, name = "space-platform-foundation" } })

    force.technologies["rocket-silo"].researched = true
    force.technologies["advanced-asteroid-processing"].researched = true


end


local function StartPlayer(player_index)

    local player = game.players[player_index]


    local group = game.permissions.get_group("players")
    if group then
        group.add_player(player)
    end

    local position = storage.platform.surface.find_non_colliding_position("character", { 0, 0 }, 10, 0.1)
    if not position then
        position = { 0.5, 0.5 }
    end

    player.teleport({0,10}, storage.platform.surface.name)
end



script.on_event(defines.events.on_player_created, function(e)

StartPlayer(e.player_index)

end)


script.on_init(function()

StartGame()

end)