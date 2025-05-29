AstraFunctions = {}

--game.print is to all players in game
--player.print is to a single player in game
--log should go to factorio-current.log

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

AstraFunctions.TechGetPreReqs = function(tech_name)
  if (data.raw.technology[tech_name]== nil) then return end
	local reqs = {}
	for _, tech in pairs(data.raw.technology) do
		if tech.prerequisites then
			for _, prereq in ipairs(tech.prerequisites) do
				if prereq == tech_name then
					table.insert(reqs, tech.name)
					break
				end
			end
		end
	end
	return reqs
end


AstraFunctions.TechRemovePreReq = function(tech, prereq)
log("Removing prereq of " .. prereq .. " from " .. tech)
  if (data.raw["technology"][tech] == nil) then return end
   if (data.raw["technology"][tech].prerequisites == nil) then return end 
  for i, v in ipairs(data.raw["technology"][tech].prerequisites ) do
    if v == prereq then
       table.remove(data.raw["technology"][tech].prerequisites , i)
       return
    end
  end
end

AstraFunctions.TechAddPreReq = function(tech, prereq)
log("Adding prereq of " .. prereq .. " to " .. tech)
  if (data.raw["technology"][tech].prerequisites == nil) then
    data.raw["technology"][tech].prerequisites= {}
  end
  table.insert(data.raw["technology"][tech].prerequisites, prereq)
end

AstraFunctions.TechAddRecipe = function(tech, recipe)
  log("Adding recipe of " .. recipe .. " to " .. tech)
  table.insert(data.raw["technology"][tech].effects, {type = "unlock-recipe", recipe = recipe})
end

AstraFunctions.PurgeRecipe = function(recipe_name)
log("Purging Recipe: "..recipe_name)
    if (data.raw.recipe[recipe_name] == nil ) then return end
    data.raw.recipe[recipe_name].enabled = false
    data.raw.recipe[recipe_name].hidden = true
    data.raw.recipe[recipe_name].hidden_in_factoriopedia = true

    for _,tech in pairs(data.raw.technology) do 
        if (data.raw.technology[tech.name].effects == nil ) then return end
        for i, effect in pairs(data.raw.technology[tech.name].effects) do
            if (effect.type == "unlock-recipe") then
                if (effect.recipe == recipe_name) then
                    log("Removing recipe of " .. recipe_name .. " from " .. tech.name)
                    table.remove(data.raw.technology[tech.name].effects, i)       
                end
            end
        end
    end
end


