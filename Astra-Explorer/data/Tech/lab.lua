









local research_speed_bl_1 = {
	type = "technology",
	name = "research-speed-bl-1",
	icons = {
		{
			icon = "__space-age__/graphics/technology/biolab.png",
			icon_size = 256
		},
		{
			icon = "__core__/graphics/icons/technology/constants/constant-speed.png",
			icon_size = 128,
			scale = 0.5,
			shift = {50, 50}
		}
	},
	effects =
	{
	  {
		type = "laboratory-speed",
		modifier = 0.4
	  }
	},
	prerequisites = {"research-speed-6", "electromagnetic-science-pack", "biolab"},
	unit =
	{
	  count = 5000,
	  ingredients =
	  {
		{"automation-science-pack", 1},
		{"logistic-science-pack", 1},
		{"chemical-science-pack", 1},
		{"utility-science-pack", 1},
		{"space-science-pack", 1},
		{"electromagnetic-science-pack", 1},
		{"agricultural-science-pack",    1}
	  },
	  time = 60
	},
	upgrade = true
}





data:extend({
    {
        type = "technology",
        name = "mercy",
        localised_name = "Mercy",
        localised_description = "exfret give'th, and exfret take'th away.",
        icon = "__fun_mode__/graphics/savior.png",
        icon_size = 600,
        unit = {
            count = 5,
            time = 10,
            ingredients = {
                {"automation-science-pack", 1}
            }
        },
        prerequisites = {
            "automation-science-pack"
        },
        effects = {
            {type = "laboratory-productivity", modifier = 0.01}
        }
    }
})