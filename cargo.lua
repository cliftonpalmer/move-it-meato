Cargo = {}

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
    love.graphics.polygon('fill', self.physics.body:getWorldPoints(self.physics.shape:getPoints()))
end

function Cargo:physics(world)
    self.physics = {}
    self.physics.damping = 0.7

    self.physics.body = love.physics.newBody(world, self.position.x, self.position.y, 'dynamic')
    self.physics.body:setMass(self.mass)
    self.physics.body:setAngularDamping(self.physics.damping)
    self.physics.body:setLinearDamping(self.physics.damping)

    self.physics.shape = love.physics.newRectangleShape(self.width, self.height)

    self.physics.fixture = love.physics.newFixture(self.physics.body, self.physics.shape, 1.0)
end
