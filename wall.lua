Wall = {}

function Wall:new(x, y, width, height)
    o = {}
    o.width = width
    o.height = height
    o.position = {}
    o.position.x = x
    o.position.y = y

    setmetatable(o, self)
    self.__index = self
    return o
end

function Wall:draw()
    love.graphics.setColor(255, 255, 255)
    love.graphics.polygon('line', self.body:getWorldPoints(self.shape:getPoints()))
end

function Wall:physics(world)
    self.body = love.physics.newBody(world, self.position.x, self.position.y, 'static')
    self.shape = love.physics.newRectangleShape( self.width, self.height )
    self.fixture = love.physics.newFixture( self.body, self.shape, 1.0 )
end
