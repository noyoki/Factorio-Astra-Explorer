
local crusher_entity = table.deepcopy(data.raw["assembling-machine"]["crusher"])
crusher_entity.name="astra-simple-crusher"
crusher_entity.icons = {{icon = "__space-age__/graphics/icons/crusher.png", tint = {r=.27,g=.12}}}
crusher_entity.crafting_speed = .5
crusher_entity.energy_usage = "300kW"
crusher_entity.allowed_effects = {}
crusher_entity.module_slots = 0
crusher_entity.minable.results = {{type="item", name="astra-simple-crusher",amount=1}}

local crusher_item = table.deepcopy(data.raw.item["crusher"])
crusher_item.name="astra-simple-crusher"
crusher_item.icons = {{icon = "__space-age__/graphics/icons/crusher.png", tint = {r=.27,g=.12}}}
crusher_item.place_result = "astra-simple-crusher"



local crusher_recipe = table.deepcopy(data.raw.recipe["crusher"])
crusher_recipe.name = "astra-simple-crusher"
crusher_recipe.icons = {{icon = "__space-age__/graphics/icons/crusher.png", tint = {r=.27,g=.12}}}
crusher_recipe.results = {{type="item",name="astra-simple-crusher",amount=1}}
crusher_recipe.ingredients ={{type="item",name="steel-plate",amount=20},{type="item",name="engine-unit",amount=10}}

local collector_item = table.deepcopy(data.raw.item["asteroid-collector"])
collector_item.name="astra-simple-asteroid-collector"
collector_item.icons = {{icon = "__space-age__/graphics/icons/asteroid-collector.png", tint = {r=.27,g=.12}}}
collector_item.place_result = "astra-simple-asteroid-collector"

local collector_entity = table.deepcopy(data.raw["asteroid-collector"]["asteroid-collector"])
collector_entity.name="astra-simple-asteroid-collector"
collector_entity.icons = {{icon = "__space-age__/graphics/icons/asteroid-collector.png", tint = {r=.27,g=.12}}}
collector_entity.minable.results = {{type="item",name="astra-simple-asteroid-collector",amount=1}}
collector_entity.arm_inventory_size = 3
collector_entity.inventory_size = 10
collector_entity.collection_radius = 10
collector_entity.arm_speed_base = 25
collector_entity.arm_count_base = 1

local collector_recipe = table.deepcopy(data.raw.recipe["asteroid-collector"])
collector_recipe.name = "astra-simple-asteroid-collector"
collector_recipe.icons = {{icon = "__space-age__/graphics/icons/asteroid-collector.png", tint = {r=.27,g=.12}}}
collector_recipe.results = {{type="item",name="astra-simple-asteroid-collector",amount=1}}
collector_recipe.ingredients ={{type="item",name="steel-plate",amount=20},{type="item",name="engine-unit",amount=10},{type="item",name="electronic-circuit", amount=5}}

data:extend({crusher_item,crusher_entity,crusher_recipe,collector_item,collector_entity,collector_recipe})

local simplecrushertech = {
	type = "technology",
	name = "astra-simple-crusher-research",
	icons = {{icon = "__space-age__/graphics/icons/crusher.png", tint = {r=.27,g=.12}}},
	effects ={{type="unlock-recipe",recipe="astra-simple-crusher"}},
    prerequisites={"engine"},
	unit ={count = 50,ingredients ={{"automation-science-pack", 1},{"logistic-science-pack",1}},time = 15}
}

local simplecollectortech = {
	type = "technology",
	name = "astra-simple-asteroid-collector-research",
	icons = {{icon = "__space-age__/graphics/icons/asteroid-collector.png", tint = {r=.27,g=.12}}},
	effects ={{type="unlock-recipe",recipe="astra-simple-asteroid-collector"}},
    prerequisites={"engine"},
	unit ={count = 50,ingredients ={{"automation-science-pack", 1},{"logistic-science-pack",1}},time = 15}
}

local crushertech = {
	type = "technology",
	name = "astra-crusher-research",
	icon = "__space-age__/graphics/icons/crusher.png",
	effects ={{type="unlock-recipe",recipe="crusher"}},
    prerequisites={"astra-space-travel-research"},
	unit ={count = 100,ingredients ={{"automation-science-pack", 1},{"logistic-science-pack",1},{"chemical-science-pack",1}},time = 30}
}

local collectortech = {
	type = "technology",
	name = "astra-asteroid-collector-research",
	icon = "__space-age__/graphics/icons/asteroid-collector.png",
	effects ={{type="unlock-recipe",recipe="asteroid-collector"}},
    prerequisites={"astra-space-travel-research","electric-engine"},
	unit ={count = 100,ingredients ={{"automation-science-pack", 1},{"logistic-science-pack",1},{"chemical-science-pack",1}},time = 30}
}

local cargotech = {
	type = "technology",
	name = "astra-cargo-research",
	icon = "__space-age__/graphics/icons/cargo-bay.png",
	effects ={{type="unlock-recipe",recipe="cargo-bay"}},
    prerequisites={"astra-space-travel-research","electric-engine"},
	unit ={count = 100,ingredients ={{"automation-science-pack", 1},{"logistic-science-pack",1},{"chemical-science-pack",1}},time = 30}
}


data:extend({simplecrushertech,simplecollectortech,crushertech,collectortech,cargotech})