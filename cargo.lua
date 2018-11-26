require 'block'

Cargo = Block:new()
Cargo.name = 'cargo'

function Cargo:new(x, y)
    o = {}
    o.color = {0, 0, 255}
    o.width = 50
    o.height = 50
    o.mass = 25
    o.position = {x=x, y=y}

    setmetatable(o, self)
    self.__index = self
    return o
end
