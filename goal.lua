require 'wall'

Goal = Wall:new()
Goal.name = 'goal'
Goal.color = {255, 255, 255}
Goal.width = 60
Goal.height = 60

function Goal:draw()
    love.graphics.setColor(self.color)
    love.graphics.polygon('line', self.body:getWorldPoints(self.shape:getPoints()))
end
