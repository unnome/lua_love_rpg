require "turn"
require "player"
require "block"
require "grid"
require "map_drawer"
require "selected_map"

local movedToNextTurn = false
currentMap = selectedMap.mapObject

function love.load()
  Grid:load()
  Turn:load()
  Player:load()
end

function love.update(dt)
  Turn:update(dt)
  Player:update(dt)
end

function love.draw()
  mapDrawer:drawMap(currentMap)
  Player:draw()
  Turn:draw()
end

function love.keyreleased(key)
  Player:move(key, currentMap)
end
