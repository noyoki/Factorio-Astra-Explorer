

local shattered_asteroids = 
{
       {
            asteroid = "metallic-asteroid-chunk",
            probability = 0.1,
            speed = 0.1,
            angle_when_stopped = 0.25,
            type = "asteroid-chunk"
        },
        {
            asteroid = "carbonic-asteroid-chunk",
            probability = 0.05,
            speed = 0.05,
            angle_when_stopped = 0.25,
            type = "asteroid-chunk"
        },
        {
            asteroid = "oxide-asteroid-chunk",
            probability = 0.05,
            speed = 0.05,
            angle_when_stopped = 0.25,
            type = "asteroid-chunk"
        },
        {
            asteroid = "crude_asteroid_chunk",
            probability = 0.05,
            speed = 0.05,
            angle_when_stopped = 0.25,
            type = "asteroid-chunk"
        }
}

data:extend({
    {
        type = "space-location",
        name = "shattered-tanker",
        starmap_icon = "__Astra-Explorer__/graphics/__rename__shipyard-starmap.png",
        starmap_icon_size = 512,
        icon = "__Astra-Explorer__/graphics/__rename__shipyard-starmap.png",
        order = "shattered",
        subgroup = "planets",
        gravity_pull = -10,
        distance = 30,
        orientation = 0.45,
        magnitude = 1.0,
        label_orientation = 0.15,
        asteroid_spawn_influence = 1,
        solar_power_in_space = 3.0,
        asteroid_spawn_influence = 2,
        asteroid_spawn_definitions = shattered_asteroids
    },
    {
        type = "space-connection",
        name = "tanker-nauvis",
        subgroup = "planet-connections",
        from = "shattered-tanker",
        to = "nauvis",
        order = "a",
        length = 2000--,
        --asteroid_spawn_definitions = mirandus_shipyard
    }
})


