# array of integers find the duplicates
# [1, 2, 3, 4, 4, 4, 5, 5]
# [4, 5]


def find_duplicates(arr)
  hash = {}
  output = []
  arr.each do |num|
    hash[num] = hash[num].to_i + 1
    output << num if hash[num] > 1
  end

  puts output.uniq.join(', ')
end

find_duplicates([1, 2, 3, 4, 4, 4, 5, 5])

