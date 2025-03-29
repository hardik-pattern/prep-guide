# Write a function named squarer which accepts an array of integers and returns an array with the
# squares of those integers. Do think of all the possible inputs, both good and bad, that might be
# passed to this function and make sure the function gracefully handles all those inputs.


def squarer(arr)
  return [] unless arr.is_a?(Array)

  arr.map { |num| (num * num) rescue nil }
end

# when passing actual integer arr:
puts squarer([1, 2, 3, 4])

# when passing actual string + integer arr:
puts squarer([1, 'test', 3, 4])

