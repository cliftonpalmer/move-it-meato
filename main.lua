local player = require 'player'

function love.load()
end

function love.draw()
    player.draw()
end

function love.update(dt)
    -- global commands
    if love.keyboard.isDown("escape") then
        love.event.quit()
    end

    player.update(dt)
end

function love.quit()
    print('Thanks for playing!')
end
