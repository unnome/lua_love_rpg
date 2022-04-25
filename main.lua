require "turn"
require "player"
require "block"
require "grid"
require "map_drawer"

local movedToNextTurn = false
currentMap = Map1

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
  --Grid:draw()
  mapDrawer:drawMap(currentMap)
  Player:draw()
  Turn:draw()
end

function love.keyreleased(key)
  Player:move(key, currentMap)
  --movePlayer(key, gameState.player_grid_position.x, gameState.player_grid_position.y, gameState.map_size_x, gameState.map_size_y)
end
