
--fix naming schemes
local crude_crush = table.deepcopy(data.raw.recipe["crude_asteroid_chunk_crushing"])
AstraFunctions.PurgeRecipe("crude_asteroid_chunk_crushing")
crude_crush.name = "astra-crude-asteroid-chunk-crushing"
crude_crush.results = {{type="item", name="stone", amount = 5}}
crude_crush.ingredients ={{ type = "item", name = "astra-crude-asteroid-chunk-item", amount = 1 }}

local crude_chunk = table.deepcopy(data.raw["asteroid-chunk"]["crude_asteroid_chunk"])
data.raw["asteroid-chunk"]["crude_asteroid_chunk"].enabled = false
crude_chunk.name = "astra-crude-asteroid-chunk"

local crude_item = table.deepcopy(data.raw.item["crude_asteroid_chunk_item"])
data.raw.item["crude_asteroid_chunk_item"].enabled = false
crude_item.name = "astra-crude-asteroid-chunk-item"

--add missing recipes/items
local oilstone = table.deepcopy(data.raw.item["solid-fuel"])
oilstone.name = "astra-oil-stone"
oilstone.stack_size = 50
oilstone.icons = {{icon = "__base__/graphics/icons/solid-fuel.png", tint = {0,0,0,1} }}
oilstone.fuel_value =  "0J"
oilstone.fuel_category = nil
oilstone.spoil_tickets = 60*300
oilstone.subgroup = "space-material"
oilstone.fuel_acceleration_multiplier = nil
oilstone.fuel_top_speed_multiplier = nil
oilstone.fuel_emissions_multiplier = nil
oilstone.fuel_glow_color = nil

local crude_asteroid_chunk_crushing = table.deepcopy(data.raw.recipe["advanced-metallic-asteroid-crushing"])
crude_asteroid_chunk_crushing.name = "astra-advanced-crude-asteroid-chunk-crushing"
crude_asteroid_chunk_crushing.icon = "__Astra-Asteroids__/graphics/crude-asteroid-chunk-crushing.png"
crude_asteroid_chunk_crushing.order = "f"
crude_asteroid_chunk_crushing.enabled = false
crude_asteroid_chunk_crushing.ingredients ={{ type = "item", name = "astra-crude-asteroid-chunk-item", amount = 1 }}
crude_asteroid_chunk_crushing.results =
{
    { type = "item", name = "stone", amount=5 },
    { type = "item", name = "coal", amount=5 },
    { type = "item", name = "astra-oil-stone", amount=5 }
}

local oilstone_processing = table.deepcopy(data.raw.recipe["ice-melting"])
oilstone_processing.name = "astra-oilstone-processing"
oilstone_processing.icons = {{icon = "__base__/graphics/icons/solid-fuel.png", tint = {0,0,0,1} }}
oilstone_processing.enabled = false
oilstone_processing.ingredients ={{ type = "item", name = "astra-oil-stone", amount = 1 }}
oilstone_processing.results ={{type="fluid", name="crude-oil", amount=200}}
oilstone_processing.allow_productivty = false


data:extend({crude_crush,crude_chunk,crude_item,oilstone,crude_asteroid_chunk_crushing,oilstone_processing})
