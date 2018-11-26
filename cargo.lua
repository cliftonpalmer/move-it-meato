require 'block'

Cargo = Block:new()
Cargo.name = 'cargo'
Cargo.color = {0, 255, 0}
Cargo.width = 50
Cargo.height = 50
Cargo.mass = 25

function Cargo:new(o)
    o = o or {}
    setmetatable(o, self)
    self.__index = self
    return o
end
