require("scripts.utils")
require("data.Integrations.astra_asteroids")
require("data.planets.shattered_tanker")
require("data.planets.vulcanus_asteroid_belt")
require("data.Tech.space_start")
require("data.planets.void")
require("data.Tech.platform-starter-pack")


data:extend({
    {
        type = "custom-input",
        name = "close_astra_rocket_gui",
        key_sequence = "ESCAPE",
        consuming = "none",
        enabled = true
    }
})

data:extend{
    {
        type = "custom-input",
        name = "astra_leave_hub",
        key_sequence = 'RETURN',
        consuming = "none",
        alternative_key_sequence="G",
        action="lua",
        enabled = true
    }
}
