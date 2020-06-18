
elevations = [0, 3, 6, 2, 7, 4, 5, 3, 8, 1, 2]
# new array should return [4, 3, 2, 4, 1]
# expected output 14

water_units = []
elevations.each_with_index do |elevation, i|
  # to find a valley, we want to find the max elevation on
  # either side of our current index
  hills = [elevations[0..i].max, elevations[i..-1].max]
  # we want to find the smaller of the 2 hills,
  # as the water won't reach the peak of the higher hill
  small_hill = hills.min
  # we can subtract the elevation at our current index
  # from the elevation of the smallest hill to the calculate
  # how much water can fill the valley at that position
  valley_units = small_hill - elevation
  # I know this isn't entirely necessary since 0 wouldn't factor into the sum
  # but figured it would be slightly faster in that the sum function
  # would only need to look through 5 positions instead of 11
  if valley_units > 0
    water_units << valley_units
  end
end

# we then need to sum the water array to get the total amount of water captured
water_units.sum
