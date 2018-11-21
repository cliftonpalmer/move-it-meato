local player = {}
player.name = 'player'
player.width = 50 -- meters
player.height = 50
player.mass = 150 -- kilograms
player.damping = 0.9
player.acceleration = 400
player.torque = 100

player.position = {}
player.position.x = love.graphics.getWidth() / 2
player.position.y = love.graphics.getHeight() / 2

function player:draw()
    love.graphics.setColor(255, 0, 0)
    love.graphics.polygon('fill', self.body:getWorldPoints(self.shape:getPoints()))
end

function player:physics(world)
    self.body = love.physics.newBody(world, self.position.x, self.position.y, 'dynamic')
    self.body:setAngularDamping(self.damping)
    self.body:setLinearDamping(self.damping)

    self.shape = love.physics.newRectangleShape( self.width, self.height )

    self.fixture = love.physics.newFixture( self.body, self.shape, 1.0 )
end

function player:update(dt)
    if love.keyboard.isDown("w") then
        self.body:applyForce(0, -self.acceleration)
    end
    if love.keyboard.isDown("s") then
        self.body:applyForce(0, self.acceleration)
    end

    if love.keyboard.isDown("a") then
        self.body:applyForce(-self.acceleration, 0)
    end
    if love.keyboard.isDown("d") then
        self.body:applyForce(self.acceleration, 0)
    end

    if love.keyboard.isDown("right") then
        self.body:applyAngularImpulse(self.torque)
    end
    if love.keyboard.isDown("left") then
        self.body:applyAngularImpulse(-self.torque)
    end
end

return player
