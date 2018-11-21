Block = {}
Block.name = 'block'
Block.width = 25
Block.height = 50
Block.mass = 10 -- kilograms
Block.damping = 0.8
Block.friction = 0.8

Block.position = {}
Block.position.x = 0
Block.position.y = 0

function Block:new(x, y)
    o = { position = {} }
    o.position.x = x
    o.position.y = y

    setmetatable(o, self)
    self.__index = self
    return o
end

function Block:draw()
    love.graphics.setColor(0, 0, 255)
    love.graphics.polygon('fill', self.body:getWorldPoints(self.shape:getPoints()))
end

function Block:physics(world)
    self.body = love.physics.newBody(world, self.position.x, self.position.y, 'dynamic')
    self.body:setMass(self.mass)
    self.body:setAngularDamping(self.damping)
    self.body:setLinearDamping(self.damping)

    self.shape = love.physics.newRectangleShape( self.width, self.height )

    self.fixture = love.physics.newFixture( self.body, self.shape, 1.0 )
    self.fixture:setFriction(self.friction)
end
