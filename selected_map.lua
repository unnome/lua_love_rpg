require "maps.map1"
require "maps.map2"

selectedMap = {
  mapObject = Map1
}

selectedMapProperties = {
  map_size_x = #selectedMap.mapObject.terrain[1],
  map_size_y = #selectedMap.mapObject.terrain,
}
