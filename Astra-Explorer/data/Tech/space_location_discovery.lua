

local space_discovery_tech = {
	type = "technology",
	name = "astra-space-discovery-research",
	icon ="__Astra-Explorer__/thumbnail.png",
    icon_size = 144,
	effects ={
        {type="change-recipe-productivity", change=.2, recipe="metallic-asteroid-crushing"},
        {type="change-recipe-productivity", change=.2, recipe="advanced-metallic-asteroid-crushing"},   
        {type="change-recipe-productivity", change=.2, recipe="carbonic-asteroid-crushing"},        
        {type="change-recipe-productivity", change=.2, recipe="advanced-carbonic-asteroid-crushing"},
        {type="change-recipe-productivity", change=.2, recipe="oxide-asteroid-crushing"},        
        {type="change-recipe-productivity", change=.2, recipe="advanced-oxide-asteroid-crushing"},
    },
    prerequisites={"space-platform-thruster","rocket-silo","space-science-pack"},
	unit ={count = 20,ingredients ={{"automation-science-pack", 1},{"logistic-science-pack",1},{"chemical-science-pack",1},{"space-science-pack",5}},time = 30}
}







data:extend({space_discovery_tech})

for _, tech in pairs(data.raw.technology) do
    if (tech.effects ~= nil) then
        local unlockCount = 0
        for _, effect in pairs(tech.effects) do
            if (effect.type =="unlock-space-location") then
                unlockCount = unlockCount+1
            end
        end
        if (unlockCount > 0) then
            AstraFunctions.TechAddPreReq(tech.name, "astra-space-discovery-research")
        end
    end
end






