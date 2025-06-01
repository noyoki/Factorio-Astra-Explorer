
local EarthBoundTech = {
	type = "technology",
	name = "astra-research-earthbound",
	icon = "__base__/graphics/technology/landfill.png",
	effects ={},
	unit ={count = 5,ingredients ={{"automation-science-pack", 1}},time = 5}
}
data:extend({EarthBoundTech})


local list_of_techs_to_Earthbound = 
{"steam-power"
,"oil-gathering"
,"fluid-wagon"
,"electric-mining-drill"
,"steel-axe"
,"landfill"     --------------
,"radar"
,"night-vision-equipment"
,"heavy-armor"
,"stone-wall"
,"gate"
,"railway"
,"braking-force-1"
,"braking-force-2"
,"braking-force-3"
,"braking-force-4"
,"braking-force-5"
,"braking-force-6"
,"braking-force-7"
,"automated-rail-transportation"
,"automobilism"
,"electric-energy-distribution-1"
,"electric-energy-distribution-2"
,"follower-robot-count-1"
,"follower-robot-count-2"
,"follower-robot-count-3"
,"follower-robot-count-4"
,"follower-robot-count-5"
,"refined-flammables-1"
,"refined-flammables-2"
,"refined-flammables-3"
,"refined-flammables-4"
,"refined-flammables-5"
,"refined-flammables-6"
,"refined-flammables-7"
,"electric-weapons-damage-1"
,"electric-weapons-damage-2"
,"electric-weapons-damage-3"
,"electric-weapons-damage-4"
,"energy-shield-equipment"
,"energy-shield-mk2-equipment"
,"tank"
,"flamethrower"
,"defender"
,"distractor"
,"destroyer"
,"land-mine"
,"discharge-defense-equipment"
,"personal-laser-defense-equipment"
,"cliff-explosives"
,"tesla-weapons"
,"health"
,"artillery"
,"atomic-bomb"
,"spidertron"
,"artillery-shell-damage-1"
,"artillery-shell-range-1"
,"artillery-shell-speed-1"
,"mining-productivity-1"  
,"mining-productivity-2"  
,"mining-productivity-3"  
,"uranium-mining"
,"uranium-processing"
,"elevated-rail"
,"rail-support-foundations"

--[[

artifical soil
bacteria cultivation
big mining drill
calcite processing
tree seeding
fish breeding
biter egg handling
captivity
overgrowth soil
lightning collector

foundation
captive biter spawner

]]

}
for i, eb in pairs(list_of_techs_to_Earthbound) do
    if (data.raw.technology[eb] == nil) then
        log("Can't find tech to Earthbind: "..eb)
        table.remove(list_of_techs_to_Earthbound,i)
    end
end

log("Earthbound Script")
for i, tech in pairs(data.raw.technology) do
    local isEarthBoundTech = false
    for _, eb in pairs(list_of_techs_to_Earthbound) do
        if (eb == tech.name) then 
            isEarthBoundTech = true
        end
    end

    if (not isEarthBoundTech and tech.prerequisites ~= nil) then
        for _, prereq in pairs(tech.prerequisites) do
            for _, eb in pairs(list_of_techs_to_Earthbound) do
                if (prereq == eb) then
                    AstraFunctions.TechRemovePreReq(tech.name, eb)
                end
            end
        end
    end
end


for i, v in ipairs(list_of_techs_to_Earthbound) do
    AstraFunctions.TechAddPreReq(v, "astra-research-earthbound")
end

if settings.startup["astra-hide-earthbound-techs"].value == true then
    log("Earthbind Hide Script")
    for _, eb in ipairs(list_of_techs_to_Earthbound) do
        local tech = data.raw.technology[eb]
        if (tech.effects ~= nil) then
            for i, effect in ipairs(tech.prerequisites) do
                if (effect.type=="unlock-recipe") then
                    AstraFunctions.PurgeRecipe(effect.recipe)
                end
            end
        end


        data.raw.technology[eb].enabled = false
        data.raw.technology[eb].hidden = true
        data.raw.technology[eb].visible_when_disabled  = false       
    end

    data.raw.technology["astra-research-earthbound"].enabled = false
    data.raw.technology["astra-research-earthbound"].hidden = true
    data.raw.technology["astra-research-earthbound"].visible_when_disabled  = false      

    --starting techs
    AstraFunctions.PurgeRecipe("stone-furnace")
    AstraFunctions.PurgeRecipe("steel-furnace")
    AstraFunctions.PurgeRecipe("wooden-chest")
    AstraFunctions.PurgeRecipe("iron-chest")
    AstraFunctions.PurgeRecipe("burner-mining-drill")
    AstraFunctions.PurgeRecipe("burner-inserter")    

    --military that doesnt apply on spaceships
    AstraFunctions.PurgeRecipe("submachine-gun")
    AstraFunctions.PurgeRecipe("shotgun")
    AstraFunctions.PurgeRecipe("shotgun-shell")
    AstraFunctions.PurgeRecipe("grenade")
    AstraFunctions.PurgeRecipe("light-armor")
    AstraFunctions.PurgeRecipe("rocket-launcher")    
    AstraFunctions.PurgeRecipe("poison-capsule")    
    AstraFunctions.PurgeRecipe("slowdown-capsule")    
    AstraFunctions.PurgeRecipe("combat-shotgun")    
    AstraFunctions.PurgeRecipe("combat-shotgun-shell")    
    AstraFunctions.PurgeRecipe("cluster-grenade")    

end
