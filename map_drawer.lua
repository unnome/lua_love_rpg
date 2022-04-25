require "block"
require "grid"
require "maps.map2"
require "maps.map1"
require "format_view"

mapDrawer = {

}

function mapDrawer:drawMap(map)
  for iy, l in ipairs(map.terrain) -- the y
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
