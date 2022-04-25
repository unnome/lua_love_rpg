Grid = {
  terrain = {
    {"grass", "river", "grass", "grass", "grass", "grass", "grass", "grass", "grass", "grass",}, 
    {"grass", "river", "river", "river", "grass", "grass", "grass", "grass", "grass", "grass",}, 
    {"grass", "grass", "grass", "river", "grass", "grass", "grass", "grass", "grass", "grass",}, 
    {"grass", "grass", "grass", "river", "river", "grass", "grass", "grass", "grass", "grass",}, 
    {"grass", "grass", "grass", "grass", "river", "grass", "grass", "grass", "grass", "grass",}, 
    {"grass", "grass", "grass", "grass", "river", "grass", "grass", "grass", "grass", "grass",}, 
    {"grass", "grass", "grass", "grass", "river", "river", "grass", "grass", "grass", "grass",}, 
    {"grass", "grass", "grass", "grass", "grass", "river", "grass", "grass", "grass", "grass",}, 
  }
}
for i,l in ipairs(Grid.terrain)
do 
  result = ""
  for a, b in ipairs(l)
  do
    print(i .. "-" ..a )
    if result == ""
    then
      result = l[a]
    else
      result = result .. "-" .. l[a]
    end
  end
  print(result)
end
