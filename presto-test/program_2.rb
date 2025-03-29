# Write a function printer which accepts an integer number and prints all the numbers from 1 to that
# given number but for every number that is a multiple of 3 it prints “Presto” and for every number that
# is a multiple of 5 it prints “Apps” and for every number that is a multiple of both 3 and 5 it prints
# “Presto Apps”

def printer(input_num)
  (1..input_num).each do |num|
    if((num % 3 == 0) && (num % 5 == 0))
      puts "Presto App"
    elsif(num % 3 == 0)
      puts "Presto"
    elsif(num % 5 == 0)
      puts "App"
    else
      puts num
    end
  end
end


puts printer(15)
