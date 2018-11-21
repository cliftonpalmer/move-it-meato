local Block = require 'block'

local blocks = {}
blocks.sequence = {}

function blocks:add_block(x, y)
    table.insert(self.sequence, Block:new(x, y))
end

function blocks:draw()
    for i, block in pairs(self.sequence) do
        block:draw()
    end
end

function blocks:physics(world)
    for i, block in pairs(self.sequence) do
        block:physics(world)
    end
end

return blocks
