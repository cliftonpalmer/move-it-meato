function player_grip_fixture(f)
    local body1 = player.fixture:getBody()
    local body2 = f:getBody()
    local x, y = body1:getWorldCenter()
    player.joint = love.physics.newPrismaticJoint(body1, body2, x, y, x + 10, y + 10, true)
    player.joint_created = love.timer.getTime() + 1.0
end
love.handlers.player_grip_fixture = player_grip_fixture

-- main
function love.load()
    world = require 'world'
    velocityiterations = 8
    positioniterations = 3
    world:setCallbacks(beginContact, endContact, preSolve, postSolve)

    player = require 'player'
    maps = require 'maps'

    -- init physics
    player:physics(world)
    maps:physics(world)
end

function beginContact(a, b, co)
    local other_fixture

    if player.fixture == a then
        other_fixture = b
    elseif player.fixture == b then
        other_fixture = a
    else
        return
    end

    if not player.joint and love.keyboard.isDown('up') then
        love.event.push('player_grip_fixture', other_fixture)
    end
end

function love.draw()
    player:draw()
    maps:draw()
end

function love.update(dt)
    -- global commands
    if love.keyboard.isDown("escape") then
        love.event.quit()
    end

    player:update(dt)
    world:update( dt, velocityiterations, positioniterations )
end

function love.quit()
    print('Thanks for playing!')
end
