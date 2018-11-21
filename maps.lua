local maps = {}
maps.index = 1
maps.sequence = {
    { 0, 1, 0, 1, 0, 0, 1, 0, 0, 0 },
    { 0, 1, 0, 1, 1, 0, 1, 0, 1, 0 },
    { 0, 0, 1, 1, 1, 1, 1, 0, 1, 0 },
    { 1, 1, 0, 1, 1, 0, 0, 0, 1, 0 },
    { 1, 1, 1, 1, 0, 0, 1, 0, 0, 0 },
    { 1, 1, 1, 1, 1, 0, 1, 0, 0, 0 },
    { 1, 1, 1, 1, 0, 1, 1, 0, 0, 0 },
    { 1, 1, 1, 0, 0, 1, 1, 0, 0, 0 },
    { 1, 0, 1, 0, 1, 1, 1, 0, 0, 0 },
    { 1, 0, 1, 0, 1, 1, 1, 0, 0, 0 },
    { 1, 0, 1, 0, 0, 1, 1, 0, 0, 0 },
}

local blocks = require 'blocks'

local grid_width = love.graphics.getWidth() / #maps.sequence
local grid_height = love.graphics.getHeight() / #maps.sequence[1]

for row_index, row in pairs(maps.sequence) do
    for col_index, value in pairs(row) do
        if value > 0 then
            local block_x = row_index * grid_width + grid_width / 2
            local block_y = col_index * grid_height + grid_height / 2
            blocks:add_block(block_x, block_y)
        end
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
