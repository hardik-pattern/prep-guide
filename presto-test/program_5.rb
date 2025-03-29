# Write a function pattern_printer which will accept an integer value and print the diamond pattern
# using the * (star / asterisk) as per the examples shown below :


def pattern_printer(number)
  k = (number * 2) - 1
  number_copy = number
  arr_copy = []
  (0...number).each do |index|
    arr = []
    number_copy = number_copy - 1
    item_copy = number_copy

    (index + 1).times do |item|
      arr << item_copy
      item_copy = item_copy + 2
    end

    arr_copy << arr

    (0..k).each do |item|
      if(arr.include?(item))
        print "*"
      else
        print "_"
      end
    end
    puts ''
  end

  arr_copy.reverse.each do |arr|
    (0..k).each do |item|
      if(arr.include?(item))
        print "*"
      else
        print "_"
      end
    end
    puts ''
  end
end

pattern_printer(5)

# number = 3
# k = 5
# _ _ * _ _  => i = 0, j = 2
# _ * _ * _  => i = 1, j = 1, 3
# * _ * _ *  => i = 2, j = 0, 2, 4
