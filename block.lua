Block = {
  size = 50,
}

function Block:load()
end

function Block:update(dt)
end

function Block:draw()
end

function Block:drawBlock(mode, x, y, r, g, b)
  love.graphics.setColor(r, g, b)
  love.graphics.rectangle(mode,x,y, self.size, self.size, 3, 3)
end
