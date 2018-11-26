-- main

require 'physics'
require 'maps'

function love.load()
    world = require 'world'
    velocityiterations = 8
    positioniterations = 3
    world:setCallbacks(beginContact, endContact, preSolve, postSolve)

    Maps:loadNext()
    player = Maps.loaded.player
    Maps:physics(world)
end

function love.draw()
    Maps:draw()
end

function love.update(dt)
    -- global commands
    if love.keyboard.isDown("escape") then
        love.event.quit()
    end

    Maps:update(dt)
    world:update( dt, velocityiterations, positioniterations )
end

function love.quit()
    print('Thanks for playing!')
end
