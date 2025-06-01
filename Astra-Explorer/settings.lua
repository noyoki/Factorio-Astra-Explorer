if mods["any-planet-start"] then
    APS.add_choice("astra-shattered-tanker")
	APS.set_default_choice("astra-shattered-tanker")
end

data:extend({{
    type = "int-setting",
    name = "astra-asteroid-stack-size",
    setting_type = "startup",
    minimum_value = 1,
    default_value = 5,
    maximum_value = 10,
    allow_blank = false
}})

data:extend({{
    type = "bool-setting",
    name = "astra-hide-earthbound-techs",
    setting_type = "startup",
    default_value = true
}})

data:extend({{
    type = "bool-setting",
    name = "astra-hide-original-planets",
    setting_type = "startup",
    default_value = true
}})

data.raw["bool-setting"]["include-crude-asteroid"].hidden  = true
data.raw["bool-setting"]["biolab-use-nutrient-solution"].hidden  = true
data.raw["bool-setting"]["biochamber-nutrient-solution-flow-through"].hidden  = true
data.raw["bool-setting"]["water-needed-to-make-nutrient-solution"].hidden  = true
data.raw["bool-setting"]["include-crude-asteroid"].forced_value  = true
data.raw["bool-setting"]["biolab-use-nutrient-solution"].forced_value  = true
data.raw["bool-setting"]["biochamber-nutrient-solution-flow-through"].forced_value  = true
data.raw["bool-setting"]["water-needed-to-make-nutrient-solution"].forced_value  = true
data.raw["string-setting"]["atan-kovarex-mode"].allowed_values = {"cheap"}
data.raw["string-setting"]["atan-kovarex-mode"].default_value  = "cheap"