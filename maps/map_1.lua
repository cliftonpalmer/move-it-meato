-- map 1

require 'block'
require 'player'
require 'wall'
require 'goal'

local width = love.graphics.getWidth()
local height = love.graphics.getHeight()

local map = {}
map.player = Player:new({position={x=width-40, y=40}})
map.goal = Goal:new({position=map.player.position, width=60, height=10})

local blocks = {}
-- player
table.insert(blocks, map.player)

-- goal
table.insert(blocks, map.goal)

-- bounding box
table.insert(blocks, Wall:new({position={x=0, y=height/2}, width=20, height=height-30}))
table.insert(blocks, Wall:new({position={x=width, y=height/2}, width=20, height=height-30}))

table.insert(blocks, Wall:new({position={x=width/2, y=0}, width=width-30, height=20}))
table.insert(blocks, Wall:new({position={x=width/2, y=height}, width=width-30, height=20}))

-- other walls
table.insert(blocks, Wall:new({position={x=width/4 * 3, y=height/4}, width=20, height=height-30}))
table.insert(blocks, Wall:new({position={x=width/4 * 1, y=height/4 * 3}, width=20, height=height-30}))

-- obstacles
table.insert(blocks, Block:new({
    name='cargo', color={0,255,0}, mass=30, width=35, height=35, position = {x=40, y=height-40}
    }))

for i=1,5 do
    for j=1,5 do
        table.insert(blocks, Block:new({width=50, height=25, position = {x=100*i, y=100*j}}))
    end
end

map.blocks = blocks
return map
