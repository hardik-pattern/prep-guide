
# Write a class named DataPacket which has two attributes

require 'json'

class DataPacket
  attr_accessor :array_data
  attr_accessor :hash_data

  def array_data=(data)
    @array_data = data.split(',')
  end

  def hash_data=(data)
    @hash_data = JSON.parse(data)
  end

  def array_data
    # @array_data
    "[#{@array_data.join(', ')}]"
  end

  def hash_data
    @hash_data
  end
end


a = DataPacket.new
a.array_data = '1,2,3'
puts a.array_data

a.hash_data = '{"a": 1, "b": 2, "c": {"d": 3, "e": 4}}'

puts a.hash_data


