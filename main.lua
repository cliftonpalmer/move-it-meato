-- physics
local world = require 'world'
local velocityiterations = 8
local positioniterations = 3

local player = require 'player'
local Block = require 'block'
local block = Block:new(150, 250)

-- main
function love.load()
    player:physics(world)
    block:physics(world)
end

function love.draw()
    player:draw()
    block:draw()
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
