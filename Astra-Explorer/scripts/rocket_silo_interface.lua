AstraInterface = {}

AstraInterface.on_surface_change = function(event)
    local player = game.get_player(event.player_index)

    if not player then return end
    AstraInterface.destroy_gui(player)

end


AstraInterface.escape = function(event)
    local player = game.get_player(event.player_index)
    AstraInterface.destroy_gui(player)
end

AstraInterface.on_gui_click = function(event)
    local name = event.element.name
    local player = game.get_player(event.player_index)
    if (player == nil) then return end

    if (name == "open-astra-explorer-rocket-gui-button") then
        AstraInterface.create_or_destroy_gui(player)
    elseif (name == "close-astra-explorer-rocket-gui-button") then
        AstraInterface.destroy_gui(player)
    elseif (name == "astra-explorer-launch-platform-button") then
        AstraInterface.LaunchPlatform(player,event)
    elseif (name == "astra-explorer-jump-platform-button") then
        AstraInterface.JumpPlatform(player,event)
    end
end

AstraInterface.JumpPlatform = function(player,event)

    if player.surface.platform == nil then return end
    local currLocation = player.surface.platform.space_location
    if (currLocation == nil) then return end

    local name = nil
    local children = event.element.parent.children
    for i, platform in pairs(children) do
        if (children[i].name == "astra-explorer-jump-platforms") then
            local idx = children[i].selected_index
            name = children[i].get_item(idx)
            
        end
    end

    local platforms = game.forces.player.platforms
    for i, platform in pairs(platforms) do
        if (platform.space_location ~= nil ) then 
            if (platform.space_location.name == currLocation.name) then
                if (platform.name == name) then
                    player.teleport({0,1}, platform.surface.name)
                end
            end
        end
    end
end

AstraInterface.LaunchPlatform = function(player,event)
    local entity = AstraInterface.LastOpenedSilo[player.name]
    if (entity == nil) then 
        player.print("Can't find current Rocket Silo")
    return end

    local inventory = entity.get_inventory(defines.inventory.rocket_silo_rocket)
    if (inventory == nil) then 
        player.print("Rocket Silo has no Inventory")
    return end
    local starterpacks = inventory.get_item_count("space-platform-starter-pack")
    if (starterpacks == 0) then 
        player.print("Rocket Silo has no Starter Packs")   
    return end

    --Determine where the rocket silo IS 
    local surface = entity.surface
    if (surface.platform == nil) then 
        player.print("Cant Find Silo's platform")   
    return end
    if (surface.platform.space_location == nil) then 
        player.print("Space platform is not at location")   
    return end

    --what did we want the new platform named?
    local name = nil
    local children = event.element.parent.children
    for i, val in pairs(children) do
        if (children[i].name == "astra-launch-name-platform-box") then
            name = children[i].text         
        end
    end

    --make a spaceplatform and remove the starter pack from the inventory
    local platform = AstraFunctions.CreatePlatform(surface.platform.space_location.name)
    platform.name = name
    inventory.clear()
end

AstraInterface.LastOpenedSilo = {}

AstraInterface.on_gui_open = function(event)
    local player = game.get_player(event.player_index)
    local entity = event.entity
    AstraInterface.LastOpenedSilo[player.name] = entity
    AstraInterface.create_entry(player)
end

AstraInterface.create_entry = function(player)

    if player.gui.relative["entry-astra-explorer-rocket-gui"] then return end

    local anchor = {gui=defines.relative_gui_type.rocket_silo_gui, position = defines.relative_gui_position.right}
    local frame = player.gui.relative.add{
        type = "frame",
        name = "entry-astra-explorer-rocket-gui",
        anchor = anchor,
        tags = {mod = "astra-explorer"}
    }
    frame.add{
        type="button",
        name = "open-astra-explorer-rocket-gui-button",
        caption = "Explorer Rocket Extras",
        tags = {mod = "astra-explorer"}}
end

AstraInterface.create_gui = function(player)

    AstraInterface.destroy_gui(player)

    local mainframe = player.gui.screen.add{
        type="frame",
        name="astra-explorer-rocket-gui",
        direction="vertical",
        tags = {mod = "astra-explorer"}
    }
    mainframe.auto_center = true
    mainframe.bring_to_front()

    local titlebar = mainframe.add{
        type = "flow",
        name = "titlebar",
        direction = "horizontal",
        tags = {mod = "astra-explorer"}
    }
    titlebar.drag_target = mainframe

    -- Title label
    titlebar.add{
        type = "label",
        caption = "Space Platform Rocket Silo",
        style = "frame_title",
        tags = {mod = "astra-explorer"}
    }

    local spacer = titlebar.add{
        type = "empty-widget",
        style = "draggable_space_header",
        ignored_by_interaction = true,
        tags = {mod = "astra-explorer"}
    }
    spacer.style.height = 24
    spacer.style.horizontally_stretchable = true 

        titlebar.add{
        type = "sprite-button",
        name = "close-astra-explorer-rocket-gui-button",
        style = "frame_action_button",
        sprite = "utility/close",
        tags = {mod = "astra-explorer"}
    }

    local launchframe = mainframe.add{
        type = "frame",
        name = "astra-launch-frame",
        direction = "vertical",
        style = "frame",
        tags = {mod = "astra-explorer"}
    }

    local launchflow = launchframe.add{
        name = "jump-flow",
        type = "flow",
        direction = "vertical",
        tags = {mod = "astra-explorer"}
    }

    launchflow.add{
        type = "label",
        caption = "New Platform Name",
        tags = {mod = "astra-explorer"}
    }

    launchflow.add{
        type = "text-box",
        name = "astra-launch-name-platform-box",
        tags = {mod = "astra-explorer"}
    }
    
    launchflow.add{
        type = "button",
        name = "astra-explorer-launch-platform-button",
        caption = "Launch New Platform",
        style = "confirm_button",
        tags = {mod = "astra-explorer"}
    }

    local jumpframe = mainframe.add{
        type = "frame",
        name = "astra-jumpframe",
        direction = "vertical",
        style = "frame",
        tags = {mod = "astra-explorer"}
    }

    local platformflow = jumpframe.add{
        name = "platform-flow",
        type = "flow",
        direction = "vertical",
        tags = {mod = "astra-explorer"}
    }

    platformflow.add{
        type = "label",
        caption = "Select local platform to jump to",
        tags = {mod = "astra-explorer"}
    }
    
    local platforms = AstraInterface.GetLocalPlatforms(player)

    platformflow.add{
        type = "drop-down",
        name = "astra-explorer-jump-platforms",
        items = platforms,
        selected_index = 1,
        tags = {mod = "astra-explorer"}
    }

    platformflow.add{
        type = "button",
        name = "astra-explorer-jump-platform-button",
        style = "confirm_button",
        caption = "Jump to Platform",
        tags = {mod = "astra-explorer"}
    }

end

AstraInterface.GetLocalPlatforms = function(player)
    if player.surface.platform == nil then return end
    local currLocation = player.surface.platform.space_location
    if (currLocation == nil) then return end
    local platforms = game.forces.player.platforms
    local names = {}
    for i, platform in pairs(platforms) do
        if(platform.valid == true) then
            if (platform.space_location ~= nil ) then 
                if (platform.space_location.name == currLocation.name) then
                    table.insert(names, platform.name)
                end
            end
        end
    end
    return names
end

AstraInterface.destroy_gui = function(player)
    local frame = player.gui.screen["astra-explorer-rocket-gui"]
    if frame then frame.destroy() end
end

AstraInterface.create_or_destroy_gui = function(player)
    local interface = player.gui.screen["astra-explorer-rocket-gui"]
    if interface then AstraInterface.destroy_gui(player)
    else AstraInterface.create_gui(player)
    end
end