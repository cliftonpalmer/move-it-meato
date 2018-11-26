require 'block'

Player = Block:new()

function Player:new(x, y)
    o = {}
    o.color = {255, 0, 0}
    o.width = 50
    o.height = 50
    o.mass = 150
    o.acceleration = 600
    o.torque = 100
    o.position = {x=x, y=y}

    setmetatable(o, self)
    self.__index = self
    return o
end

function Player:update(dt)
    if love.keyboard.isDown("w") then
        self.body:applyForce(0, -self.acceleration)
    end
    if love.keyboard.isDown("s") then
        self.body:applyForce(0, self.acceleration)
    end

    if love.keyboard.isDown("a") then
        self.body:applyForce(-self.acceleration, 0)
    end
    if love.keyboard.isDown("d") then
        self.body:applyForce(self.acceleration, 0)
    end

    if love.keyboard.isDown("right") then
        self.body:applyAngularImpulse(self.torque)
    end
    if love.keyboard.isDown("left") then
        self.body:applyAngularImpulse(-self.torque)
    end

    if self.joint
    and love.timer.getTime() > self.joint_created
    and love.keyboard.isDown("up") then
        print('Destroying joint')
        local joint = self.joint
        joint:destroy()
        joint:release()
        self.joint_created = nil
        self.joint = nil
    end
end
