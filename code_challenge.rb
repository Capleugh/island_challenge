
elevations = [0, 3, 6, 2, 7, 4, 5, 3, 8, 1, 2]
# mapped array should return [0, 0, 0, 4, 0, 3, 2, 4, 0, 1, 0]
# expected output 14

elevations.map.with_index do |elevation, i|
  # to find a valley, we want to find the max elevation on
  # either side of our current index
  hills = [elevations[0..i].max, elevations[i..-1].max]
  # we want to find the smaller of the 2 hills,
  # as the water won't reach the peak of the higher hill
  small_hill = hills.min
  # we can subtract the elevation at our current index
  # from the elevation of the smallest hill to the calculate
  # how much water can fill the valley at that position
  small_hill - elevation
  # we then need to sum the water array to get the total amount of water captured
end.sum
