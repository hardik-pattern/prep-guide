# Write a method named interval_iterator which will take the following parameters :




# Usage with the current implementation
# -------------------------------------------
# intervals = interval_iterator(sd, ed, 'monthly')
#   do_something_with_interval(i)
# intervals.each do |i|
#   do_something_with_interval(i)
# end
# -------------------------------------------

intervals = interval_iterator(sd, ed, 'monthly')
do_something_with_interval(intervals)


# New usage
# -----------------
# interval_iterator(sd, ed, 'monthly') { |i| do_something_with_interval(i) }

interval_iterator("01-01-2016", "31-05-2016", "monthly") { |i| do_something_with_interval(i) }

def do_something_with_interval(i)
  puts "I am doing something with the interval : #{i}"
end

def interval_iterator(start_date, end_date, interval, &block)
  start_day, start_month, start_year = start_date.split('-', 3)
  end_day, end_month, end_year = end_date.split('-', 3)

  start_date = Date.new(start_year.to_i, start_month.to_i, start_day.to_i)
  end_date = Date.new(end_year.to_i, end_month.to_i, end_day.to_i)

  interval = interval == 'monthly' ? 'month' : 'week'

  current = start_date

  block.call(['interval 1', 'interval 2', 'interval 3'])

  current = current.send("next_#{interval}")
end


def middleware(params, block) #second_person
  object = IntervalHandler.new

  loop to call the interval
    response = object.next(params)
    block(response)
  end
end

# middleware() first_person

# 1. We don't want user to write the loop (we are not calling method again and again)
# 2. We don't want to allocate array in one shot

require 'date'

# def interval_iterator(start_date, end_date, interval)
#   start_day, start_month, start_year = start_date.split('-', 3)
#   end_day, end_month, end_year = end_date.split('-', 3)

#   start_date = Date.new(start_year.to_i, start_month.to_i, start_day.to_i)
#   end_date = Date.new(end_year.to_i, end_month.to_i, end_day.to_i)

#   return if start_date > end_date
#   return if ['weekly', 'monthly'].exclude?(interval)

#   start_date = start_date.send("beginning_of_#{interval}")
#   end_date = end_date.send("end_of_#{interval}")

#   # send
#   # eval
#   # call
#   # constantize

  # result = []
#   while(end_date > start_date)
#     if(interval == "weekly")
#       # puts (start_date).to_s
        block.call(start_date)
      # result << start_date

#       start_date = start_date.next_week
#     else
#       # puts start_date
      # result << start_date
        block.call(start_date)



#       start_date = start_date.next_month
#     end
#   end

#   result
# end


# interval_iterator("01-01-2016", "31-05-2016", "monthly");

class IntervalHandler
  def initialize(start_date, end_date, interval)
    @start_date = start_date
    @end_date = end_date
    @interval = interval == 'monthly' ? 'month' : 'week'

    @current = start_date
  end

  def next
    return nil if @current > end_date

    result = @current
    @current = @current.send("next_#{@interval}")
    result
  end
end

handler = IntervalHandler.new("01-01-2016", "31-05-2016", "monthly")
handler.next
