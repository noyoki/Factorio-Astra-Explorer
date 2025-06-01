AstraFunctions = {}

--game.print is to all players in game
--player.print is to a single player in game
--log should go to factorio-current.log

AstraFunctions.Print = function(text)
    game.print(text)
end

AstraFunctions.CreatePlatform = function(name,location,pack)
  local platform = game.forces.player.create_space_platform { planet = "astra-void", starter_pack = pack,name=name }
  platform.apply_starter_pack()
  platform.space_location = location
  return platform
end

AstraFunctions.CreatePlatform = function(location)
    local platform = game.forces.player.create_space_platform { planet = "astra-void", starter_pack = "space-platform-starter-pack" }
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

AstraFunctions.TechRemovePreReq = function(tech, prereq)
  if (data.raw["technology"][tech] == nil) then 
    log("Failed to remove prereq "..prereq.." from "..tech.. " tech not found")
  elseif (data.raw["technology"][prereq] == nil) then 
    log("Failed to remove prereq "..prereq.." from "..tech.. " prereq not found")
  else
    log("Removing prereq of " .. prereq .. " from " .. tech)
    if (data.raw["technology"][tech].prerequisites == nil) then return end 
    for i, v in ipairs(data.raw["technology"][tech].prerequisites ) do
      if v == prereq then
        table.remove(data.raw["technology"][tech].prerequisites , i)
       return
      end
    end
  end
end


AstraFunctions.TechAddPreReq = function(tech, prereq)
  if (data.raw["technology"][tech] == nil) then
    log("Failed to add prereq "..prereq.." to "..tech.." tech not found")
  elseif (data.raw["technology"][prereq] == nil) then
    log("Failed to add prereq "..prereq.." to "..tech.." prereq not found")
  else
    log("Adding prereq of " .. prereq .. " to " .. tech)
    if (data.raw["technology"][tech].prerequisites == nil) then
      data.raw["technology"][tech].prerequisites= {}
    end
    table.insert(data.raw["technology"][tech].prerequisites, prereq)
  end
end

AstraFunctions.TechAddRecipe = function(tech, recipe)
  log("Adding recipe of " .. recipe .. " to " .. tech)
  table.insert(data.raw["technology"][tech].effects, {type = "unlock-recipe", recipe = recipe})
end

AstraFunctions.TechRemoveRecipe = function(tech,recipe)
  for i, effect in pairs(data.raw.technology[tech].effects) do
      if (effect.type == "unlock-recipe") then
          if (effect.recipe == recipe) then
              log("Removing recipe of " .. recipe .. " from " .. tech)
              table.remove(data.raw.technology[tech].effects, i)
              return
          end
      end
  end
  log("TechRemoveRecipe failed - recipe not found")
end


AstraFunctions.PurgeRecipe = function(recipe_name)

  if (data.raw.recipe[recipe_name] == nil ) then
    log("Failed to purge recipe: "..recipe_name)
  else
    log("Purging Recipe: "..recipe_name)
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
end



local spawnpoint4 = {{probability = .4,speed=5,distance=0},{probability = .4,speed=5,distance=1}}
local spawnpoint3 = {{probability = .3,speed=5,distance=0},{probability = .3,speed=5,distance=1}}
local spawnpoint2 = {{probability = .2,speed=5,distance=0},{probability = .2,speed=5,distance=1}}
local spawnpoint1 = {{probability = .1,speed=5,distance=0},{probability = .1,speed=5,distance=1}}
local chunks = 
{
  {type = "asteroid-chunk",spawn_points=spawnpoint4,asteroid = "metallic-asteroid-chunk"},
  {type = "asteroid-chunk",spawn_points=spawnpoint3,asteroid = "oxide-asteroid-chunk"},
  {type = "asteroid-chunk",spawn_points=spawnpoint3,asteroid = "carbonic-asteroid-chunk"}
}
local smalls = 
{
  {type = "asteroid-chunk",spawn_points=spawnpoint3,asteroid = "metallic-asteroid-chunk"},
  {type = "asteroid-chunk",spawn_points=spawnpoint2,asteroid = "oxide-asteroid-chunk"},
  {type = "asteroid-chunk",spawn_points=spawnpoint2,asteroid = "carbonic-asteroid-chunk"},
  {type = "entity",spawn_points=spawnpoint1,asteroid = "small-metallic-asteroid"},
  {type = "entity",spawn_points=spawnpoint1,asteroid = "small-oxide-asteroid"},
  {type = "entity",spawn_points=spawnpoint1,asteroid = "small-carbonic-asteroid"}
}
local mediums = 
{
  {type = "asteroid-chunk",spawn_points=spawnpoint1,asteroid = "metallic-asteroid-chunk"},
  {type = "asteroid-chunk",spawn_points=spawnpoint1,asteroid = "oxide-asteroid-chunk"},
  {type = "asteroid-chunk",spawn_points=spawnpoint1,asteroid = "carbonic-asteroid-chunk"},
  {type = "entity",spawn_points=spawnpoint2,asteroid = "small-metallic-asteroid"},
  {type = "entity",spawn_points=spawnpoint1,asteroid = "small-oxide-asteroid"},
  {type = "entity",spawn_points=spawnpoint1,asteroid = "small-carbonic-asteroid"},
  {type = "entity",spawn_points=spawnpoint1,asteroid = "medium-metallic-asteroid"},
  {type = "entity",spawn_points=spawnpoint1,asteroid = "medium-oxide-asteroid"},
  {type = "entity",spawn_points=spawnpoint1,asteroid = "medium-carbonic-asteroid"}
}
local bigs = 
{
  {type = "entity",spawn_points=spawnpoint1,asteroid = "small-metallic-asteroid"},
  {type = "entity",spawn_points=spawnpoint1,asteroid = "small-oxide-asteroid"},
  {type = "entity",spawn_points=spawnpoint1,asteroid = "small-carbonic-asteroid"},
  {type = "entity",spawn_points=spawnpoint2,asteroid = "medium-metallic-asteroid"},
  {type = "entity",spawn_points=spawnpoint1,asteroid = "medium-oxide-asteroid"},
  {type = "entity",spawn_points=spawnpoint1,asteroid = "medium-carbonic-asteroid"},
  {type = "entity",spawn_points=spawnpoint1,asteroid = "big-metallic-asteroid"},
  {type = "entity",spawn_points=spawnpoint1,asteroid = "big-oxide-asteroid"},
  {type = "entity",spawn_points=spawnpoint1,asteroid = "big-carbonic-asteroid"}
}

AstraFunctions.GetSpaceConnectionAsteroids = function(difficulty)
  if (difficulty=="chunks") then return chunks
  elseif (difficulty=="smalls") then return smalls
  elseif (difficulty=="mediums") then return mediums
  elseif (difficulty=="bigs") then return bigs
  else return nil
  end
end