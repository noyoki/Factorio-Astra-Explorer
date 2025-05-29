

local function findNonCollision(player)
    local position = player.physical_surface.find_non_colliding_position("character", player.physical_position, 5, 0.2) or { 4.69, 4.69 }
    return position
end

local function StartGame()

    if remote.interfaces.freeplay then
        if remote.interfaces.freeplay.set_disable_crashsite then
            remote.call("freeplay", "set_disable_crashsite", true)
            remote.call("freeplay", "set_skip_intro", true)
        end
    end
    
    local force = game.forces.player
    force.technologies["space-platform"].researched = true
    force.unlock_space_platforms()
    force.unlock_space_location("shattered-tanker")

    force.lock_space_location("nauvis")

    if (storage.platform == nil) then storage.platform = {} end
end

local function StartPlayer(player_index)
    local player = game.players[player_index]
    local playername = player.name

    local platform = AstraFunctions.CreatePlatform("shattered-tanker")
    platform.name = playername.. "'s Remnant"
    storage.platform[playername] = platform

    local position = findNonCollision(player)
    player.teleport(position, storage.platform[playername].surface.name)
    player.clear_items_inside()
end

script.on_event(defines.events.on_player_created, function(e)
    StartPlayer(e.player_index)
end)

script.on_init(function()
    StartGame()
end)








-- Handle Escape key press to close the GUI
script.on_event("close_astra_rocket_gui", function(event)
    
    AstraInterface.escape(event)
end)

script.on_event(defines.events.on_gui_click, function(event)
    if (event.element.tags == nil ) then return end
    if (event.element.tags.mod ~= "astra-explorer") then return end

    AstraInterface.on_gui_click(event)
end)

script.on_event(defines.events.on_player_changed_surface,function(event)
    AstraInterface.on_surface_change(event)
end)

script.on_event(defines.events.on_player_joined_game, function(event)
    local player = game.get_player(event.player_index)
end)

script.on_event(defines.events.on_gui_opened, function(event)
    if (event.entity == nil) then return end
    if (event.entity.type ~= "rocket-silo" ) then return end
    AstraInterface.on_gui_open(event)
end)

script.on_event("astra_leave_hub",function(event)
    local player = game.players[event.player_index]
    if player.controller_type == defines.controllers.remote
    then
        if not player.hub then
            return
        end
        player.leave_space_platform()
        player.set_controller { type = player.physical_controller_type, character = player.character }

        local position = findNonCollision(player)
        player.teleport(position)
    end
end)

