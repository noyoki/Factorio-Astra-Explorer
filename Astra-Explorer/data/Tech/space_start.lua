





require("earthbound")
require("basic_space_machines")
require("space_location_discovery")

AstraFunctions.TechRemoveRecipe("space-platform","asteroid-collector")
AstraFunctions.TechRemoveRecipe("space-platform","cargo-bay")
AstraFunctions.TechRemoveRecipe("space-platform","crusher")
table.insert(data.raw["technology"]["space-platform"].effects, {type = "unlock-recipe", recipe = "space-platform-foundation"})

--remap oil processing 
data.raw["technology"]["oil-processing"].research_trigger = nil
data.raw["technology"]["oil-processing"].unit ={ count=100, time = 30, ingredients = {{"automation-science-pack", 1},{"logistic-science-pack", 1}}}
AstraFunctions.TechAddPreReq("oil-processing","fluid-handling")

--add electric smelt earlier, so buff the second research with something cool. 
AstraFunctions.TechAddRecipe("advanced-material-processing","electric-furnace")
local advMaterial2Bonus_iron = {type="change-recipe-productivity", change = .1, recipe="iron-plate"}
local advMaterial2Bonus_stee = {type="change-recipe-productivity", change = .1, recipe="steel-plate"}
local advMaterial2Bonus_copp = {type="change-recipe-productivity", change = .1, recipe="copper-plate"}
local advMaterial2Bonus_ston = {type="change-recipe-productivity", change = .1, recipe="stone-brick"}
table.insert(data.raw["technology"]["advanced-material-processing-2"].effects,advMaterial2Bonus_iron)
table.insert(data.raw["technology"]["advanced-material-processing-2"].effects,advMaterial2Bonus_stee)
table.insert(data.raw["technology"]["advanced-material-processing-2"].effects,advMaterial2Bonus_copp)
table.insert(data.raw["technology"]["advanced-material-processing-2"].effects,advMaterial2Bonus_ston)
AstraFunctions.TechAddRecipe("oil-processing","ice-melting")



data.raw["recipe"]["military-science-pack"].ingredients={{type="item",name="piercing-rounds-magazine",amount=1},{type="item",name="rocket",amount=1}} 
AstraFunctions.TechRemovePreReq("rocketry",",military-science-pack")
AstraFunctions.TechAddPreReq("rocketry","military-2")
AstraFunctions.TechAddPreReq("explosive-rocketry","military-science-pack")
--AstraFunctions.TechAddPreReq("military-science-pack","rocketry")

AstraFunctions.TechAddPreReq("modular-armor","military")
AstraFunctions.TechRemoveRecipe("advanced-asteroid-processing","advanced-thruster-fuel")
AstraFunctions.TechRemoveRecipe("advanced-asteroid-processing","advanced-thruster-oxidizer")

AstraFunctions.TechRemoveRecipe("space-platform","advanced-thruster-oxidizer")
AstraFunctions.TechAddPreReq("chemical-science-pack","astra-discover-tanker-research")

if mods["planet-hopper"] then
log("Planet Hopper mod found - Altering unlocks")
data.raw.recipe["planet-hopper-launcher"].enabled = false
AstraFunctions.TechAddRecipe("rocket-silo","planet-hopper-launcher")

AstraFunctions.TechRemoveRecipe("rocket-silo","rocket-silo")
AstraFunctions.TechRemoveRecipe("rocket-silo","rocket-part")
end


data.raw["technology"]["rocket-fuel"].unit ={ count=50, time = 30, ingredients = {{"automation-science-pack", 1},{"logistic-science-pack", 1},{"chemical-science-pack",1}}}
data.raw["technology"]["rocket-silo"].unit ={ count=300, time = 30, ingredients = {{"automation-science-pack", 1},{"logistic-science-pack", 1},{"chemical-science-pack",1}}}
AstraFunctions.TechRemoveRecipe("rocket-silo","cargo-landing-pad")


data.raw["technology"]["space-science-pack"].research_trigger = nil
data.raw["technology"]["space-science-pack"].unit ={ count=300, time = 30, ingredients = {{"automation-science-pack", 1},{"logistic-science-pack", 1},{"chemical-science-pack",1}}}
AstraFunctions.TechAddPreReq("space-science-pack","astra-cargo-research")
AstraFunctions.TechAddPreReq("space-science-pack","astra-crusher-research")
AstraFunctions.TechAddPreReq("space-science-pack","astra-asteroid-collector-research")
AstraFunctions.TechAddPreReq("space-science-pack","astra-thruster-fuel-research")
AstraFunctions.TechAddPreReq("space-platform-thruster","astra-thruster-fuel-research")
AstraFunctions.TechAddPreReq("space-platform-thruster","astra-space-travel-research")
AstraFunctions.TechAddPreReq("rocket-silo","astra-space-travel-research")
AstraFunctions.TechRemovePreReq("space-science-pack","rocket-silo")
AstraFunctions.TechRemovePreReq("space-science-pack","space-platform-thruster")
AstraFunctions.TechRemovePreReq("space-science-pack","space-platform")
AstraFunctions.TechRemovePreReq("space-platform","rocket-silo")

AstraFunctions.TechAddPreReq("asteroid-productivity","space-science-pack")


--readd adv thruster fluids where?