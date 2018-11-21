local maps = {}
maps.index = 1
maps.sequence = {
    { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 },
    { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 },
    { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 },
    { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 },
    { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 },
}

local blocks = require 'blocks'
for row_index, row in pairs(maps.sequence) do
    for col_index, value in pairs(row) do
        local block_x = row_index * love.graphics.getWidth() / #maps.sequence[1]
        local block_y = col_index * love.graphics.getHeight() / #maps.sequence
        blocks:add_block(block_x, block_y)
    end
end
maps.blocks = blocks

function maps:draw()
    self.blocks:draw()
end

function maps:physics(world)
    self.blocks:physics(world)
end

return maps
