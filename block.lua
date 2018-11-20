local block = {}

block.width = 25
block.height = 50

block.mass = 10
block.friction = 0.96
block.velocity = {
    x = 0,
    y = 0,
}
block.position = {
    x = 100,
    y = 200,
}

function block.update(dt)
end

function block.draw()
    love.graphics.rectangle('fill', block.position.x, block.position.y, block.width, block.height)
end

return block
