local player = {}
player.width = 50 -- meters
player.height = 50
player.mass = 150 -- kilograms
player.friction = 0.8
player.damping = 0.1
player.acceleration = 400
player.position = {}
player.position.x = love.graphics.getWidth() / 2
player.position.y = love.graphics.getHeight() / 2

function player:draw()
    love.graphics.polygon('fill', self.physics.body:getWorldPoints(self.physics.shape:getPoints()))
end

function player:initPhysics(world)
    self.physics = {}

    self.physics.body = love.physics.newBody(world, self.position.x, self.position.y, 'dynamic')
    self.physics.body:setMass(self.mass)
    self.physics.body:setAngularDamping(self.damping)
    self.physics.body:setLinearDamping(self.damping)

    self.physics.shape = love.physics.newRectangleShape( self.width, self.height )

    self.physics.fixture = love.physics.newFixture( self.physics.body, self.physics.shape, 1.0 )
    self.physics.fixture:setFriction(player.friction)
end

function player:update(dt)
    if love.keyboard.isDown("up") then
        self.physics.body:applyForce(0, -self.acceleration)
    end
    if love.keyboard.isDown("down") then
        self.physics.body:applyForce(0, self.acceleration)
    end

    if love.keyboard.isDown("left") then
        self.physics.body:applyForce(-self.acceleration, 0)
    end
    if love.keyboard.isDown("right") then
        self.physics.body:applyForce(self.acceleration, 0)
    end
end

return player
