-- maps

Maps = {}
Maps.index = 1

function Maps:loadNext()
    self.loaded = require 'maps/map_1'
    self.index = self.index + 1
end

function Maps:draw()
    for i, block in pairs(self.loaded.blocks) do
        block:draw()
    end
end

function Maps:physics(world)
    for i, block in pairs(self.loaded.blocks) do
        block:physics(world)
    end
end

function Maps:update(dt)
    for i, block in pairs(self.loaded.blocks) do
        if block['update'] then
            block:update(dt)
        end
    end
end
