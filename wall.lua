Wall = {}
Wall.color = {255, 255, 255}
Wall.width = 20
Wall.height = 80
Wall.position = {x=0, y=0}

function Wall:new(o)
    o = o or {}
    setmetatable(o, self)
    self.__index = self
    return o
end

function Wall:draw()
    love.graphics.setColor(self.color)
    love.graphics.polygon('line', self.body:getWorldPoints(self.shape:getPoints()))
end

function Wall:physics(world)
    self.body = love.physics.newBody(world, self.position.x, self.position.y, 'static')
    self.shape = love.physics.newRectangleShape( self.width, self.height )
    self.fixture = love.physics.newFixture( self.body, self.shape, 1.0 )
end
