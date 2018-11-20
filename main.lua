-- define player
local player = {}

player.width = 50
player.height = 50
player.speed = 200
player.pos = {
    x = love.graphics.getWidth() / 2,
    y = love.graphics.getHeight() / 2,
}

function player.update(dt)
    if love.keyboard.isDown("up") then
        player.pos.y = player.pos.y - player.speed * dt
    end
    if love.keyboard.isDown("down") then
        player.pos.y = player.pos.y + player.speed * dt
    end
    if love.keyboard.isDown("right") then
        player.pos.x = player.pos.x + player.speed * dt
    end
    if love.keyboard.isDown("left") then
        player.pos.x = player.pos.x - player.speed * dt
    end
end

function player.draw()
    love.graphics.rectangle('fill', player.pos.x, player.pos.y, player.width, player.height)
end

-- main
function love.load()
end

function love.draw()
    player.draw()
end

function love.update(dt)
    player.update(dt)
end

function love.quit()
    print('Thanks for playing!')
end
