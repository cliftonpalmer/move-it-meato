local player = {}

player.width = 50
player.height = 50
player.acceleration = 0.2
player.mass = 100
player.friction = 0.96
player.velocity = {
    x = 0,
    y = 0,
}
player.position = {
    x = love.graphics.getWidth() / 2,
    y = love.graphics.getHeight() / 2,
}

function player.update(dt)
    vector = { x = 0, y = 0 }

    -- get relative velocity
    if love.keyboard.isDown("up") then
        vector.y = vector.y - player.acceleration * dt
    end
    if love.keyboard.isDown("down") then
        vector.y = vector.y + player.acceleration * dt
    end

    if love.keyboard.isDown("right") then
        vector.x = vector.x + player.acceleration * dt
    end
    if love.keyboard.isDown("left") then
        vector.x = vector.x - player.acceleration * dt
    end

    -- update player velocity
    player.velocity.x = player.velocity.x * player.friction + vector.x * player.mass
    player.velocity.y = player.velocity.y * player.friction + vector.y * player.mass

    -- update player position
    player.position.x = player.position.x + player.velocity.x
    player.position.y = player.position.y + player.velocity.y
end

function player.draw()
    love.graphics.rectangle('fill', player.position.x, player.position.y, player.width, player.height)
end

return player
