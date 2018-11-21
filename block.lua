local block = {}
block.width = 25
block.height = 75
block.mass = 10 -- kilograms
block.damping = 0.8
block.friction = 0.8
block.position = {}
block.position.x = 200
block.position.y = 200

function block:draw()
    love.graphics.polygon('fill', self.physics.body:getWorldPoints(self.physics.shape:getPoints()))
end

function block:initPhysics(world)
    self.physics = {}

    self.physics.body = love.physics.newBody(world, self.position.x, self.position.y, 'dynamic')
    self.physics.body:setMass(self.mass)
    self.physics.body:setAngularDamping(self.damping)
    self.physics.body:setLinearDamping(self.damping)

    self.physics.shape = love.physics.newRectangleShape( self.width, self.height )

    self.physics.fixture = love.physics.newFixture( self.physics.body, self.physics.shape, 1.0 )
    self.physics.fixture:setFriction(self.friction)
end

return block
