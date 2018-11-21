require 'blocks'

maps = {}
maps.index = 1
maps.blocks = Blocks:new()
maps.sequence = {
    { 2, 1, 0, 1, 0, 0, 1, 0, 0, 0 },
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

local grid_width = love.graphics.getWidth() / #maps.sequence
local grid_height = love.graphics.getHeight() / #maps.sequence[1]

for row_index, row in pairs(maps.sequence) do
    for col_index, value in pairs(row) do
        if value > 0 then
            local x = row_index * grid_width + grid_width / 2
            local y = col_index * grid_height + grid_height / 2
            if value == 1 then
                maps.blocks:add_block(x, y)
            elseif value == 2 then
                maps.blocks:add_cargo(x, y, 30, 30, 50)
            end
        end
    end
end

function maps:draw()
    self.blocks:draw()
end

function maps:physics(world)
    self.blocks:physics(world)
end

return maps
