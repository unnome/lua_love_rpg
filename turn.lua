require "game_state"

Turn = {
}

function Turn:load()
  self.font = love.graphics.newFont(55)
end

function Turn:update(dt)
end

function Turn:draw()
  love.graphics.setColor(1,1,1)
  love.graphics.print("Turn: " .. gameState.turn, self.font)
end


function Turn:goToNextTurn()
  gameState.turn = gameState.turn + 1
end

