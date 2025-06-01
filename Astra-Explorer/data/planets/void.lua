

data:extend(
{
    {
        type = "planet",
        name = "astra-void",
        icon = "__Astra-Explorer__/graphics/icons/shattered-tanker.png",
        starmap_icon = "__Astra-Explorer__/graphics/icons/shattered-tanker.png",
        gravity_pull = 0,
        distance = 9999,
        orientation = 0.172,
        magnitude = 9999,
        order = "void",
        subgroup = "planets",
        pollutant_type = "pollution",
        solar_power_in_space = 9999,
        draw_orbit = false,
        surface_properties = {
            ["day-night-cycle"] = 9999,
            ["magnetic-field"] = 9999,
            ["solar-power"] = 9999,
            pressure = 9999,
            gravity = 9999
        },
        surface_render_parameters = {},
        asteroid_spawn_influence = 1,
        asteroid_spawn_definitions = {},
        persistent_ambient_sounds =
        {
          base_ambience =
          {
            {sound = {filename = "__space-age__/sound/wind/base-wind-gleba-night.ogg", volume = 0.8, advanced_volume_control = {darkness_threshold = 0.85}}},
            {sound = {filename = "__space-age__/sound/wind/base-wind-gleba-day.ogg", volume = 0.8, advanced_volume_control = {darkness_threshold = -0.7}}}
          }
        },
        player_effects =
        { 
          type = "cluster",
          cluster_count = 10,
          distance = 8,
          distance_deviation = 8
        },
        hidden = true,
        hidden_in_factoriopedia = true,
    }
})