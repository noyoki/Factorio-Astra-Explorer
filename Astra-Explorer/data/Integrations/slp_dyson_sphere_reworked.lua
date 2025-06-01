

if mods["slp-dyson-sphere-reworked"] then

local sun_connection_asteroids = {
      {type = "asteroid-chunk",spawn_points={{probability = .2,speed=5,distance=0},{probability = .2,speed=5,distance=1}},asteroid ="metallic-asteroid-chunk"},
      {type = "asteroid-chunk",spawn_points={{probability = .2,speed=5,distance=0},{probability = .2,speed=5,distance=1}},asteroid = "oxide-asteroid-chunk"},
      {type = "asteroid-chunk",spawn_points={{probability = .2,speed=5,distance=0},{probability = .2,speed=5,distance=1}},asteroid = "carbonic-asteroid-chunk"},
      {type = "asteroid-chunk",spawn_points={{probability = .2,speed=5,distance=0},{probability = 0,speed=5,distance=.5}},asteroid = "slp-plasma-chunk"} 
}

data:extend({  
        {
            type = "space-connection",
            name = "astra-tanker-sunorbit",
            subgroup = "planet-connections",
            to = "astra-shattered-tanker",
            from = "slp-solar-system-sun",
            order = "a",
            length = 5000,
            icon = "__slp-dyson-sphere-reworked__/graphics/icons/sun_icon.png",
            asteroid_spawn_definitions = sun_connection_asteroids
        }
    })


    if settings.startup["astra-hide-original-planets"].value == true then
        data.raw["space-connection"]["slp-vulcanus-sun"]=nil
        data.raw["space-connection"]["slp-nauvis-sun"]=nil
    end
end



