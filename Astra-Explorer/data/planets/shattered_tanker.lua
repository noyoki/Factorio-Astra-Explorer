





local shattered_asteroids = 
{
       {
            asteroid = "metallic-asteroid-chunk",
            probability = .4,
            speed = 0.05,
            angle_when_stopped = 1,
            type = "asteroid-chunk"
        },
        {
            asteroid = "oxide-asteroid-chunk",
            probability = .1,
            speed = 0.05,
            angle_when_stopped = 1,
            type = "asteroid-chunk"
        },
        {
            asteroid = "carbonic-asteroid-chunk",
            probability = .1,
            speed = 0.05,
            angle_when_stopped = .1,
            type = "asteroid-chunk"
        },
        {
            asteroid = "crude_asteroid_chunk",
            probability = .2,
            speed = 0.05,
            angle_when_stopped = 1,
            type = "asteroid-chunk"
        }
}



local connectionchunks = 
{
  {type = "asteroid-chunk",spawn_points={{probability = .3,speed=5,distance=0},{probability = .3,speed=5,distance=1}},asteroid = "metallic-asteroid-chunk"},
  {type = "asteroid-chunk",spawn_points={{probability = .2,speed=5,distance=0},{probability = .2,speed=5,distance=1}},asteroid = "oxide-asteroid-chunk"},
  {type = "asteroid-chunk",spawn_points={{probability = .2,speed=5,distance=0},{probability = .2,speed=5,distance=1}},asteroid = "carbonic-asteroid-chunk"},
  {type = "asteroid-chunk",spawn_points={{probability = 0,speed=5,distance=0},{probability = 0,speed=5,distance=1}},asteroid = "astra-crude-asteroid-chunk"},
}




data:extend({
    {
        type = "space-location",
        name = "astra-shattered-tanker",
        starmap_icon = "__Astra-Explorer__/graphics/icons/shattered-tanker.png",
        starmap_icon_size = 144,
        icon = "__Astra-Explorer__/graphics/icons/shattered-tanker.png",
        icon_size = 144,
        order = "shattered",
        subgroup = "planets",
        gravity_pull = 0,
        distance = 10,
        draw_orbit = false,
        orientation = 0.19,
        magnitude = 1.0,
        label_orientation = 0.15,
        solar_power_in_space = 300.0,
        asteroid_spawn_influence = 2,
        asteroid_spawn_definitions = shattered_asteroids
    },

    {
        type = "space-connection",
        name = "astra-tanker-vulcanusasteroid",
        subgroup = "planet-connections",
        from = "astra-shattered-tanker",
        to = "astra-vulcanus-asteroid-cluster",
        order = "a",
        length = 2000,
        asteroid_spawn_definitions = connectionchunks
    }

})




local discover_tanker_tech = {
	type = "technology",
	name = "astra-discover-tanker-research",
    icons = {{icon ="__Astra-Explorer__/graphics/icons/shattered-tanker.png",tint={r=0,g=0,b=0},    icon_size = 144,}},
	effects ={{type="unlock-recipe",recipe="astra-advanced-crude-asteroid-chunk-crushing"},{type="unlock-recipe",recipe="astra-oilstone-processing"}},
    prerequisites={"astra-simple-asteroid-collector-research","astra-simple-crusher-research","oil-processing"},
	unit ={count = 50,ingredients ={{"automation-science-pack", 1},{"logistic-science-pack",1}},time = 30}
}

local space_travel_tech = {
	type = "technology",
	name = "astra-space-travel-research",
	icon ="__Astra-Explorer__/graphics/icons/shattered-tanker.png",
    icon_size = 144,
	effects ={
        {type="change-recipe-productivity", change=.2, recipe="astra-crude-asteroid-chunk-crushing"},        
        {type="change-recipe-productivity", change=.2, recipe="astra-advanced-crude-asteroid-chunk-crushing"}
    },
    prerequisites={"astra-discover-tanker-research","astra-simple-asteroid-collector-research","astra-simple-crusher-research","oil-processing","chemical-science-pack"},
	unit ={count = 50,ingredients ={{"automation-science-pack", 1},{"logistic-science-pack",1},{"chemical-science-pack",1}},time = 30}
}

local fuel_tech = {
	type = "technology",
	name = "astra-thruster-fuel-research",
	icon ="__space-age__/graphics/icons/fluid/thruster-fuel.png",
	effects ={{type="unlock-recipe",recipe="thruster-fuel"},{type="unlock-recipe",recipe="thruster-oxidizer"}},
    prerequisites={"astra-space-travel-research"},
	unit ={count = 100,ingredients ={{"automation-science-pack", 1},{"logistic-science-pack",1},{"chemical-science-pack",1}},time = 20}
}


data:extend({discover_tanker_tech,space_travel_tech,fuel_tech})