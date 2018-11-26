require 'block'
require 'cargo'
require 'wall'

Blocks = {}
Blocks.sequence = {}

function Blocks:new()
    o = { sequence = {} }
    setmetatable(o, self)
    self.__index = self
    return o
end

function Blocks:add_block(x, y)
    table.insert(self.sequence, Block:new(x, y))
end

function Blocks:add_wall(x, y, width, height)
    table.insert(self.sequence, Wall:new(x, y, width, height))
end

function Blocks:add_cargo(x, y, width, height, mass)
    cargo = Cargo:new(x, y, width, height, mass)
    table.insert(self.sequence, cargo)
end

function Blocks:draw()
    for i, block in pairs(self.sequence) do
        block:draw()
    end
end

function Blocks:physics(world)
    for i, block in pairs(self.sequence) do
        block:physics(world)
    end
end
