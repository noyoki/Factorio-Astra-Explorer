
local stackSize = settings.startup["asteroid-stack-size"].value

for name, _ in pairs(data.raw["asteroid-chunk"]) do
    if data.raw["item"][name] then
        log("Setting Asteroid stack size for: " .. name)
        data.raw["item"][name].stack_size = stackSize
    else
        log(name .. " not found in data.raw['item']")
    end
end