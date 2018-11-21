Cargo = {}
Cargo.name = 'cargo'

function Cargo:new(x, y, width, height, mass)
    o = {}
    o.position = {}
    o.position.x = x
    o.position.y = y
    o.width = width
    o.height = height
    o.mass = mass

    setmetatable(o, self)
    self.__index = self
    return o
end

function Cargo:draw()
    love.graphics.setColor(0, 255, 0)
    love.graphics.polygon('fill', self.body:getWorldPoints(self.shape:getPoints()))
end

function Cargo:physics(world)
    self.damping = 0.7

    self.body = love.physics.newBody(world, self.position.x, self.position.y, 'dynamic')
    self.body:setMass(self.mass)
    self.body:setAngularDamping(self.damping)
    self.body:setLinearDamping(self.damping)

    self.shape = love.physics.newRectangleShape(self.width, self.height)

    self.fixture = love.physics.newFixture(self.body, self.shape, 1.0)
end
