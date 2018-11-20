local player = require 'player'
local block = require 'block'

function love.load()
end

function love.draw()
    player.draw()
    block.draw()
end

function love.update(dt)
    -- global commands
    if love.keyboard.isDown("escape") then
        love.event.quit()
    end

    player.update(dt)
    block.update(dt)
end

function love.quit()
    print('Thanks for playing!')
end
