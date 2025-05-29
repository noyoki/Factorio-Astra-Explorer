

local EarthBoundTech = {
	type = "technology",
	name = "research-earthbound",
	icons = {
		{
			icon = "__base__/graphics/technology/landfill.png",
			icon_size = 256
		}
	},
	effects ={},
	unit =
	{
	  count = 200,
	  ingredients =
	  {
		{"automation-science-pack", 1},
	  },
	  time = 5
	}
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
,"stone-wall"         --------------
,"gate"
,"railway"
,"braking-force-1"
,"automated-rail-transportation"
,"automobilism"
,"electric-energy-distribution-1"
,"electric-energy-distribution-2"
--[[
,"uranium-mining"
,"mining-productivity-1"  
,"mining-productivity-2"  
,"mining-productivity-3"  
,"tank"
,"uranium-processing"
,"flamethrower"
,"defender"
,"follower-robot-count-1"
,"follower-robot-count-2"
,"follower-robot-count-3"
,"follower-robot-count-4"
,"follower-robot-count-5"
]]

}


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
    AstraFunctions.TechAddPreReq(v, "research-earthbound")
end


--remap oil processing 
data.raw["technology"]["oil-processing"].research_trigger = nil
data.raw["technology"]["oil-processing"].unit ={ count=100, time = 30, ingredients = {{"automation-science-pack", 1},{"logistic-science-pack", 1}}}
AstraFunctions.TechAddPreReq("oil-processing","fluid-handling")

--add electric smelt earlier, so buff the second research with something cool. 
AstraFunctions.TechAddRecipe("advanced-material-processing","electric-furnace")
local advMaterial2Bonus_iron = {type="change-recipe-productivity", change = .1, recipe="iron-plate"}
local advMaterial2Bonus_stee = {type="change-recipe-productivity", change = .1, recipe="steel-plate"}
local advMaterial2Bonus_copp = {type="change-recipe-productivity", change = .1, recipe="copper-plate"}
table.insert(data.raw["technology"]["advanced-material-processing-2"].effects,advMaterial2Bonus_iron)
table.insert(data.raw["technology"]["advanced-material-processing-2"].effects,advMaterial2Bonus_stee)
table.insert(data.raw["technology"]["advanced-material-processing-2"].effects,advMaterial2Bonus_copp)

AstraFunctions.TechAddPreReq("modular-armor","military")

AstraFunctions.PurgeRecipe("stone-furnace")
AstraFunctions.PurgeRecipe("steel-furnace")
AstraFunctions.PurgeRecipe("wooden-chest")
AstraFunctions.PurgeRecipe("burner-mining-drill")
AstraFunctions.PurgeRecipe("burner-mining-inserter")
AstraFunctions.PurgeRecipe("light-armor")
AstraFunctions.PurgeRecipe("submachine-gun")
AstraFunctions.PurgeRecipe("shotgun")
AstraFunctions.PurgeRecipe("shotgun-shells")
AstraFunctions.PurgeRecipe("grenade")

AstraFunctions.PurgeRecipe("nutrient-solution-barrel")
AstraFunctions.PurgeRecipe("empty-nutrient-solution-barrel")