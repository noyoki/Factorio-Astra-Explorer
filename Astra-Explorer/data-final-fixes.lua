
require("data.Integrations.fluid_nutrients")
require("data.Integrations.slp_dyson_sphere_reworked")

local stackSize = settings.startup["astra-asteroid-stack-size"].value

for name, _ in pairs(data.raw["asteroid-chunk"]) do
    if data.raw["item"][name] then
        log("Setting Asteroid stack size for: " .. name)
        data.raw["item"][name].stack_size = stackSize
    else
        log(name .. " not found in data.raw['item']")
    end
end



if settings.startup["astra-hide-original-planets"].value == true then

local listofOrigPlanets = 
{
    {name = "vulcanus", tech = "planet-discovery-vulcanus"},
    {name = "gleba", tech = "planet-discovery-gleba"},
    {name = "fulgora", tech = "planet-discovery-fulgora"},
    {name = "aquilo", tech = "planet-discovery-aquilo"}
}


    for _, og in pairs(listofOrigPlanets) do
    log("attempting to remove "..og.name.." from tech "..og.tech)
    if (data.raw.technology[og.tech] == nil) then
        log ("tech not found! "..og.tech)
    end
    if (data.raw.technology[og.tech].effects == nil) then
        log ("tech.effects not found! "..og.tech)
    end
        for i, effect in pairs (data.raw.technology[og.tech].effects) do
            if (effect.type =="unlock-space-location") then
                if (effect.space_location == og.name) then
                    table.remove(data.raw.technology[og.tech].effects, i)
                end
            end
        end
    end
    data.raw["planet"]["aquilo"].hidden = true
    data.raw["planet"]["fulgora"].hidden = true
    data.raw["planet"]["gleba"].hidden = true
    data.raw["planet"]["nauvis"].hidden = true
    data.raw["planet"]["vulcanus"].hidden = true

    data.raw["space-connection"]["nauvis-vulcanus"]=nil
    data.raw["space-connection"]["aquilo-solar-system-edge"]=nil
    data.raw["space-connection"]["fulgora-aquilo"]=nil
    data.raw["space-connection"]["gleba-aquilo"]=nil
    data.raw["space-connection"]["gleba-fulgora"]=nil
    data.raw["space-connection"]["nauvis-fulgora"]=nil
    data.raw["space-connection"]["nauvis-gleba"]=nil
    data.raw["space-connection"]["vulcanus-gleba"]=nil
    data.raw["space-connection"]["astra-vulcanusasteroid-vulcanus"]=nil
    data.raw["space-connection"]["astra-tanker-nauvis"]=nil
    
end

--data.raw["space-location"]["shattered-planet"].hidden = true
--data.raw["space-connection"]["solar-system-edge-shattered-planet"]=nil