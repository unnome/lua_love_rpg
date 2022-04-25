require "format_view"
require "block"
require "grid"
require "game_state"


Player = {
  health = 10,
  dead = false,
}

function Player:load()
end

function Player:update(dt)
end

function Player:draw()
  player_x = (GridPadding.x                           -- account for grid padding
    + (Block.size / 2)                      -- center the player in the block
    + gameState.player_grid_position.x * Block.size     -- account for player location
    + Grid.distanceBetweenBlocks * gameState.player_grid_position.x
  )
  player_y = (GridPadding.y                           -- account for grid padding
    + (Block.size / 2)                      -- center the player in the block
    + gameState.player_grid_position.y * Block.size     -- account for player location
    + Grid.distanceBetweenBlocks * gameState.player_grid_position.y
  )
  love.graphics.setColor(1,1,1)
  love.graphics.circle( "fill", player_x, player_y, 20)
  love.graphics.setColor(0,0,0)
  love.graphics.circle( "line", player_x, player_y, 15)
end

function Player:move(key)
  if moveIsWithinBoundaries(key) and moveIsValid(key)
    then
    if key == 'd'
      then
        gameState.player_grid_position.x = gameState.player_grid_position.x + 1
    elseif key == 'a'
    then
      gameState.player_grid_position.x = gameState.player_grid_position.x - 1
    elseif key == 'w'
    then
      gameState.player_grid_position.y = gameState.player_grid_position.y - 1
    elseif key == 's'
      then
      gameState.player_grid_position.y = gameState.player_grid_position.y + 1
    end
    Turn:goToNextTurn()
  end
end


function moveIsWithinBoundaries(key)
  if key == 'd'
    and gameState.player_grid_position.x < gameState.map_size_x
    then
    return true
  elseif key == 'a'
    and gameState.player_grid_position.x > 1
  then
    return true
  elseif key == 'w'
    and gameState.player_grid_position.y > 1
  then
    return true
  elseif key == 's'
    and gameState.player_grid_position.y < gameState.map_size_y
    then
    return true
  else return false
  end
end

function moveIsValid(key)
  if key == 'd'
    and targetBlockIsWalkable(gameState.player_grid_position.x + 1, gameState.player_grid_position.y)
    then
    return true
  elseif key == 'a'
    and targetBlockIsWalkable(gameState.player_grid_position.x - 1, gameState.player_grid_position.y)
  then
    return true
  elseif key == 'w'
    and targetBlockIsWalkable(gameState.player_grid_position.x, gameState.player_grid_position.y - 1)
  then
    return true
  elseif key == 's'
    and targetBlockIsWalkable(gameState.player_grid_position.x, gameState.player_grid_position.y + 1)
    then
    return true
  else return false
    end
end

function targetBlockIsWalkable(x, y)
  if Grid.terrain[y][x] == 'water' then return false
  else return true
  end
end

