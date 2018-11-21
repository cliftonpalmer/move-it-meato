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
    if player.fixture == a then
        print('Collision between player and '..tostring(b)..'!')
    elseif player.fixture == b then
        print('Collision between player and '..tostring(a)..'!')
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
