require "block"
require "format_view"

Grid = {
  distanceBetweenBlocks= 1,
  backgroundPadding = 10,
  terrain = {
    {"grass", "water", "grass", "grass", "grass", "grass", "grass", "grass", "grass", "grass",}, 
    {"grass", "water", "water", "water", "grass", "grass", "grass", "grass", "grass", "goal",}, 
    {"grass", "grass", "grass", "water", "grass", "grass", "grass", "grass", "grass", "grass",}, 
    {"grass", "grass", "grass", "water", "water", "grass", "grass", "grass", "grass", "grass",}, 
    {"grass", "grass", "grass", "grass", "bridge", "grass", "grass", "grass", "grass", "grass",}, 
    {"grass", "grass", "grass", "grass", "water", "grass", "grass", "grass", "grass", "grass",}, 
    {"grass", "grass", "grass", "grass", "water", "water", "grass", "grass", "grass", "grass",}, 
    {"grass", "grass", "grass", "grass", "grass", "water", "grass", "grass", "grass", "grass",}, 
  },
}


function Grid:load()
end

function Grid:update(dt)
end

function Grid:draw()
  drawGridBackground()
  drawGrid()
end

function drawGrid()
  for iy, l in ipairs(Grid.terrain) -- the y
  do
    for ix, type in ipairs(l) -- the x
    do
      if type == 'grass'
      then
        r = 56 / 255
        g = 142 / 255
        b = 60 / 255
      elseif type == 'water'
      then
        r = 0
        g = 77 / 255
        b = 207 / 255
      elseif type == 'bridge' 
      then
        r = 93 /255
        g = 64 / 255
        b = 55 / 255
      else 
        r = 1
        g = 1
        b = 1
      end
      x = (GridPadding.x + ix * Block.size + ix * Grid.distanceBetweenBlocks)
      y = (GridPadding.y + iy * Block.size + iy * Grid.distanceBetweenBlocks)
      Block:drawBlock( "fill", x, y, r, g, b)
    end
  end
end

function drawGridBackground()
  love.graphics.setColor(0.5,0.5,0.5)
  love.graphics.rectangle(
    "fill",
    GridPadding.x
    -- - Grid.backgroundPadding
    + Block.size,
    GridPadding.y
    -- - Grid.backgroundPadding
    + Block.size,
    Block.size * gameState.map_size_x
    + Grid.distanceBetweenBlocks * gameState.map_size_x
    + Grid.distanceBetweenBlocks
    ,
    Block.size * gameState.map_size_y
    + Grid.distanceBetweenBlocks * gameState.map_size_y
    + Grid.distanceBetweenBlocks
  )
end
