-- physics
local world = require 'world'
local velocityiterations = 8
local positioniterations = 3

local player = require 'player'
local maps = require 'maps'

-- main
function love.load()
    player:physics(world)
    maps:physics(world)
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
