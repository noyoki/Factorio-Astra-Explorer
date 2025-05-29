

local shattered_asteroids = 
{
       {
            asteroid = "metallic-asteroid-chunk",
            probability = 3,
            speed = 0.5,
            angle_when_stopped = .55,
            type = "asteroid-chunk"
        },
        {
            asteroid = "oxide-asteroid-chunk",
            probability = .5,
            speed = 0.5,
            angle_when_stopped = .0001,
            type = "asteroid-chunk"
        }--[[
        ,{
            asteroid = "carbonic-asteroid-chunk",
            probability = .5,
            speed = 0.05,
            angle_when_stopped = .5,
            type = "asteroid-chunk"
        },

        {
            asteroid = "crude_asteroid_chunk",
            probability = 0.05,
            speed = 0.05,
            angle_when_stopped = 0.25,
            type = "asteroid-chunk"
        }]]
}

data:extend({
    {
        type = "space-location",
        name = "shattered-tanker",
        starmap_icon = "__Astra-Explorer__/graphics/icons/shattered-tanker.png",
        starmap_icon_size = 512,
        icon = "__Astra-Explorer__/graphics/icons/shattered-tanker.png",
        order = "shattered",
        subgroup = "planets",
        gravity_pull = -10,
        distance = 30,
        orientation = 0.45,
        magnitude = 1.0,
        label_orientation = 0.15,
        solar_power_in_space = 300.0,
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
        length = 2000
    }
})


