

local function GenerateTiles()
    local tiles = {}
    for x=-8,8,1 do
        for y = -8,8,1 do
            local tile = {tile="space-platform-foundation",position = {x,y}}
            table.insert(tiles,tile)
        end
    end
end

--add missing recipes/items
local remnant = table.deepcopy(data.raw.item["space-platform-starter-pack"])
remnant.name = "astra-remnant-pack"
remnant.stack_size = 1
remnant.icons = {{icon = "__space-age__/graphics/icons/space-platform-starter-pack", tint = {r=.05,g=.05,b=.05} }}
remnant.tiles = GenerateTiles()
remnant.initial_items = {
{name="space-platform-foundation",type="item",amount = 500},
{name="solar-panel",type="item",amount = 20},
{name="astra-simple-crusher",type="item",amount = 4},
{name="astra-simple-asteroid-collector",type="item",amount = 6},
{name="inserter",type="item",amount = 6},
{name="electric-furnace",type="item",amount = 8},
{name="assembling-machine-1",type="item",amount = 2},
{name="iron-plate",type="item",amount = 50},
{name="efficiency-module-2",type="item",amount = 6},
{name="transport-belt",type="item",amount = 40}
}
