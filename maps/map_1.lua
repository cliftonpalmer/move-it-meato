-- map 1

require 'block'
require 'player'

local map = {}
map.player = Player:new(love.graphics.getWidth()/2, love.graphics.getHeight()/2)

local blocks = {}
table.insert(blocks, map.player)
table.insert(blocks, Block:new({width=50, height=25, position = {x=200, y=200}}))

map.blocks = blocks
return map
