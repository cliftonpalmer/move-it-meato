-- physics
local world = require 'world'
local velocityiterations = 8
local positioniterations = 3

-- player
local player = {}
player.width = 50 -- meters
player.height = 50
player.mass = 150 -- kilograms
player.acceleration = 400
player.position = {}
player.position.x = love.graphics.getWidth() / 2
player.position.y = love.graphics.getHeight() / 2

player.physics = {}
player.physics.body = love.physics.newBody(world, player.position.x, player.position.y, 'dynamic')
player.physics.body:setMass(player.mass)
player.physics.shape = love.physics.newRectangleShape( player.width, player.height )
player.physics.fixture = love.physics.newFixture( player.physics.body, player.physics.shape, 1.0 )
player.physics.fixture:setFriction(0.5)

function player.update(dt)
    if love.keyboard.isDown("up") then
        player.physics.body:applyForce(0, -player.acceleration)
    end
    if love.keyboard.isDown("down") then
        player.physics.body:applyForce(0, player.acceleration)
    end

    if love.keyboard.isDown("left") then
        player.physics.body:applyForce(-player.acceleration, 0)
    end
    if love.keyboard.isDown("right") then
        player.physics.body:applyForce(player.acceleration, 0)
    end
end

-- main
function love.load()
end

function love.draw()
    love.graphics.polygon('fill', player.physics.body:getWorldPoints(player.physics.shape:getPoints()))
end

function love.update(dt)
    -- global commands
    if love.keyboard.isDown("escape") then
        love.event.quit()
    end

    player.update(dt)
    world:update( dt, velocityiterations, positioniterations )
end

function love.quit()
    print('Thanks for playing!')
end
