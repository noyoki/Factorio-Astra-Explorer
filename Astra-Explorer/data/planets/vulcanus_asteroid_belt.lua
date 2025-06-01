



AstraFunctions.TechRemoveRecipe("advanced-asteroid-processing","advanced-oxide-asteroid-crushing")
AstraFunctions.TechAddRecipe("tungsten-carbide","advanced-oxide-asteroid-crushing")
data.raw.planet["vulcanus"].magnitude = data.raw.planet["vulcanus"].magnitude /2


local asteroids = 
{
       {
            asteroid = "metallic-asteroid-chunk",
            probability = 1.5,
            speed = 0.05,
            angle_when_stopped = 1,
            type = "asteroid-chunk"
        },
        {
            asteroid = "oxide-asteroid-chunk",
            probability = .7,
            speed = 0.05,
            angle_when_stopped = 1,
            type = "asteroid-chunk"
        },
        {
            asteroid = "carbonic-asteroid-chunk",
            probability = .3,
            speed = 0.05,
            angle_when_stopped = .1,
            type = "asteroid-chunk"
        }
}


data:extend({
    {
        type = "space-location",
        name = "astra-vulcanus-asteroid-cluster",
        starmap_icon = "__Astra-Explorer__/graphics/icons/vulcanus_asteroid_cluster.png",
        starmap_icon_size = 144,
        icon = "__Astra-Explorer__/graphics/icons/vulcanus_asteroid_cluster.png",
        icon_size = 144,
        order = "shattered",
        subgroup = "planets",
        gravity_pull = -10,
        distance = 9,
        orientation = .9,
        magnitude = 1.0,
        label_orientation = 0.15,
        solar_power_in_space = 300.0,
        asteroid_spawn_influence = 2,
        asteroid_spawn_definitions = asteroids
    },    
 --[[   {
        type = "space-connection",
        name = "astra-vulcanusasteroid-glebaasteroid",
        subgroup = "planet-connections",
        from = "astra-vulcanus-asteroid-cluster",
        to = "gleba",
        order = "a",
        length = 25000
    },
    {
        type = "space-connection",
        name = "astra-vulcanusasteroid-nauvisasteroid",
        subgroup = "planet-connections",
        from = "astra-vulcanus-asteroid-cluster",
        to = "nauvis",
        order = "a",
        length = 25000
    },  ]]
    {
        type = "space-connection",
        name = "astra-vulcanusasteroid-vulcanus",
        subgroup = "planet-connections",
        from = "astra-vulcanus-asteroid-cluster",
        to = "vulcanus",
        order = "a",
        length = 2000
    }
})

table.insert(data.raw.technology["planet-discovery-vulcanus"].effects, {type="unlock-space-location", space_location="astra-vulcanus-asteroid-cluster"})
