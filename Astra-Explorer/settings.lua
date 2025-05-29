if mods["any-planet-start"] then
    APS.add_choice("shattered-tanker")
	APS.set_default_choice("shattered-tanker")
end



data:extend({{
    type = "int-setting",
    name = "asteroid-stack-size",
    setting_type = "startup",
    minimum_value = 1,
    default_value = 10
}})