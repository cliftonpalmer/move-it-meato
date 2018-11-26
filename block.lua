Block = {}
Block.color = {0, 0, 255}
Block.width = 10
Block.height = 10
Block.mass = 10
Block.angular_damping = 0.9
Block.linear_damping = 0.9
Block.position = {x=0, y=0}

function Block:new(o)
    o = o or {}
    setmetatable(o, self)
    self.__index = self
    return o
end

function Block:draw()
    love.graphics.setColor(self.color)
    love.graphics.polygon('fill', self.body:getWorldPoints(self.shape:getPoints()))
end

function Block:physics(world)
    self.body = love.physics.newBody(world, self.position.x, self.position.y, 'dynamic')
    self.body:setMass(self.mass)
    self.body:setAngularDamping(self.angular_damping)
    self.body:setLinearDamping(self.linear_damping)
    self.shape = love.physics.newRectangleShape(self.width, self.height)
    self.fixture = love.physics.newFixture(self.body, self.shape, 1.0)
end
