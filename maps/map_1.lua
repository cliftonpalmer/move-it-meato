-- map 1

require 'block'
require 'player'
require 'wall'
require 'cargo'

local width = love.graphics.getWidth()
local height = love.graphics.getHeight()

local map = {}
map.player = Player:new(width/2, height/2)

local blocks = {}
table.insert(blocks, map.player)

-- bounding box
table.insert(blocks, Wall:new(0, height/2, 20, height-30))
table.insert(blocks, Wall:new(width, height/2, 20, height-30))

table.insert(blocks, Wall:new(width/2, 0,  width-30, 20))
table.insert(blocks, Wall:new(width/2, height,  width-30, 20))

-- obstacles
table.insert(blocks, Cargo:new({width=25, height=25, position = {x=40, y=40}}))
table.insert(blocks, Block:new({width=50, height=25, position = {x=200, y=200}}))

map.blocks = blocks
return map
