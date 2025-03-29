
Searching Algo -

1. Linear Search -
# Linear search is a simple algorithm that checks each element in a list sequentially until the desired element is found or the list ends

def linear_search(arr, target)
  output = 0
  arr.each_with_index do |ele, index|
    return index if ele == target
  end
  output
end

array = [10, 20, 30, 40, 50]
target = 30

result = linear_search(array, target)

2. Binary Search -
# Key Points ->
# Sorted Array: Binary search requires a sorted array.
# Divide and Conquer: The algorithm repeatedly divides the search interval in half.
# Efficiency: Binary search has a time complexity of O(logn), making it much more efficient than linear search for large arrays.

def binary_search(arr, target)
  low = 0
  high = arr.length - 1

  while low <= high
    mid = (low + high)/2
    mid_ele = arr[mid]
    if mid == target
      return mid
    elsif mid_ele < target
      low = mid + 1
    else
      high = mid - 1
    end
  end
  nil
end

array = [10, 20, 30, 40, 50, 60, 70]
target = 40

result = binary_search(array, target)

=============================================

Sorting Algo --

1. Bubble sort -
# O(n^2)
# Bubble Sort repeatedly steps through the list, compares adjacent elements, and swaps them if they are in the wrong order. The process repeats until the list is sorted.

=============================================

Linked List -
# Has node and next pointer

class Node
  attr_accessor :data, :next

  def initialize(data)
    @data = data
    @next = nil
  end
end

class LinkedList
  attr_accessor :head

  def initialize
    @head = nil
  end

  # Method to add a new node at the end of the list
  def append(data)
    new_node = Node.new(data)
    if @head.nil?
      @head = new_node
    else
      current = @head
      current = current.next while current.next # go to last node of the linked list
      current.next = new_node
    end
  end

  # Method to add a new node at the beginning of the list
  def prepend(data)
    new_node = Node.new(data)
    new_node.next = @head
    @head = new_node
  end

  # Method to delete a node by value

  3 -> 7 -> 4 -> 8

  delete(4)

  def delete(data)
    return if @head.nil?

    if @head.data == data
      @head = @head.next
      return
    end

    current = @head
    while current.next && current.next.data != data
      current = current.next
    end

    if current.next
      current.next = current.next.next
    end
  end

  # Method to display the linked list
  def display
    current = @head
    while current
      print "#{current.data} -> "
      current = current.next
    end
    puts "nil"
  end
end


list = LinkedList.new

# Append elements to the list
list.append(10)
list.append(20)
list.append(30)

# Display the list
puts "List after appending elements:"
list.display

# Prepend an element to the list
list.prepend(5)
puts "List after prepending an element:"
list.display

# Delete an element from the list
list.delete(20)
puts "List after deleting an element:"
list.display


Stack -

class Stack
  def initialize
    @stack = []
  end

  def push(element)
    @stack.push(element)
  end

  def pop
    @stack.pop
  end

  def peek
    @stack.last
  end

  def is_empty?
    @stack.size == 0
  end
end

stack = Stack.new
stack.push(6)
stack.peek
puts stack.inspect


Queue -

class Queue
  def initialize
    @queue = []
  end

  def push(element)
    @queue << element
  end

  def pop
    @queue.shift
  end

  def peek
    @queue.first
  end

  def is_empty?
    @queue.size == 0
  end
end




=============================================

Array questions -


1. Finding the missing element in the array of n elements
ex - [1, 2, 4, 5, 6]

def find_missing_element(arr, n)
  sum = arr.sum
  actual_sum = (n + n*n)/2
  missing_element = actual_sum - sum
end

arr = [1, 2, 4, 5, 6]
n = 6

2. Find duplicate in an array -
# We can use Floyd’s Tortoise and Hare (Cycle Detection) algorithm to find the duplicate number. The algorithm works by using two pointers moving at different speeds to detect a cycle.
# For achieving O(n) time
ex - [1, 3, 4, 2, 2]

def find_duplicate(arr)
  duplicate_array = arr - arr.uniq
end


3. Find the largest and the smallest numbers in the unsorted array -

def find_min_max(arr)
  min = arr.min
  max = arr.max
  [min, max]
end

arr = [3, 5, 1, 8, 9, 2]
min, max = find_min_max(arr)

4. Rotate an Array by k Positions

arr = [3, 5, 1, 8, 9, 2, 6, 7]
# after reverse
[7, 6, 2, 9, 8, 1, 5, 3]
# swapp
input - arr , k = 4
output = [9, 2, 6, 7, 3, 5, 1, 8]


# def shift_array_to_right(arr, k)
#   arr[k...arr.length]
#   reverse_array = arr.reverse!
#   start_point = 0
#   end_point = k-1
#   ((k/2) + 1).times do |i|
#     break if start_point == end_point
#     temp = reverse_array[start_point]
#     reverse_array[start_point] = reverse_array[end_point]
#     reverse_array[end_point] = temp
#     start_point += 1
#     end_point -= 1
#   end
#   reverse_array
# end

def shift_array_to_right(arr, k)
  arr[k...arr.length].concat(arr)[0...arr.length]
end

arr = [3, 5, 1, 8, 9, 2, 6, 7]
shift_array_to_right(arr, 4)

5. Find the Maximum Sum of continuos Subarray
# Kadanes algorithm

def kadanes_algo(arr)
  max_ends = arr[0]
  max_sum_so_far = arr[0]

  (1...arr.length).each do |i|
    max_ends = [arr[i], max_ends + arr[i]].max
    max_sum_so_far = [max_ends, max_sum_so_far].max
  end
  max_sum_so_far
end

arr = [-2, 1, -3, 4, -1, 2, 1, -5, 4]
kadanes_algo(arr)



6. Merge 2 sorted arrays

# Input: [2, 3, 6, 7, 8], [1, 4, 5]
# merge_array = [1, 2, 3, 4, 5, 6, 7, 8]

def merge_sorted_arrays(array1, array2)
  merged_array = []
  first_pointer = 0
  second_pointer = 0
  loop do
    if second_pointer >= array2.length
      merged_array = merged_array + (array1 - merged_array)
      return merged_array
    elsif first_pointer >= array1.length
      merged_array = merged_array + (array2 - merged_array)
      return merged_array
    end
    if array2[second_pointer] <= array1[first_pointer]
      merged_array << array2[second_pointer]
      second_pointer += 1
    else
      merged_array <<  array1[first_pointer]
      first_pointer += 1
    end
  end
end

array1 = [2, 3, 6, 7, 8]
array2 = [1, 4, 5]
merge_sorted_arrays(array1, array2)


def merge_sorted_arrays(array_1, array_2)
  merged_array = []
  first_pointer = 0
  second_pointer = 0
  loop_length = [array_1.length, array_2.length].max
  loop do
    if second_pointer >= array_2.length
      merged_array = merged_array + (array_1 - merged_array)
      return merged_array
    elsif first_pointer >= array_1.length
      merged_array = merged_array + (array_2 - merged_array)
      return merged_array
    end
    if array_1[first_pointer] > array_2[second_pointer]
      merged_array = merged_array.append(array_2[second_pointer])
      second_pointer += 1
    elsif array_1[first_pointer] < array_2[second_pointer]
      merged_array = merged_array.append(array_1[first_pointer])
      first_pointer += 1
    end
  end
  merged_array
end

array_1 = [2, 3, 6]
array_2 = [1, 4, 5]

merge_sorted_arrays(array_1, array_2)

7. Move all zeroes to the end of the array -


def move_number_to_right(arr, k)
  number_of_k = arr.count(k)
  result_arr = arr - [k]
  result_arr = result_arr + [k]*number_of_k
end

arr = [0, 3, 5, 6, 2, 0, 0]
move_number_to_right(arr, 0)


================================================

String Manipulation -

1. Reverse a String -

def reverse_string(str)
  reversed = ""
  str_length = str.length
  str_length.times { |i| reversed += str[str_length - i - 1]}
  reversed
end

reverse_string("hello")

2. Check if a string is a palindrome

def check_if_palindrome?(str)
  left = 0
  right = str.length - 1
  while left < right
    return "Not a palindrome" if str[left] != str[right]
    left += 1
    right -= 1
  end
  "Is a palidrome"
end

check_if_palindrome?("racecar")

3. Count the number of vowels in a string

def vowels_count(str)
  vowels = "aeiouAEIOU"
  count = 0
  str.each_char { |char| count += 1 if vowels.include?(char) }
  count
end

vowels_count("hello")

4. Find the first non-repeating character in a string

def first_non_repeating_char(str)
  non_repeating = []
  repeating = []
  str.each_char do |char|
    if non_repeating.include?(char) || repeating.include?(char)
      non_repeating.delete(char)
      repeating.append(char)
    else
      non_repeating.append(char)
    end
  end
  non_repeating.first
end

first_non_repeating_char("swiss")

5. Check if two strings are anagrams

def anagrams?(str1, str2)
  return str1.chars.sort == str2.chars.sort
end

def anagrams?(str1, str2)
  str1_char_map = {}
  str2_char_map = {}
  str1.each_char do |char|
    str1_char_map[char] ||= 0
    str1_char_map[char] += 1
  end
  str2.each_char do |char|
    str2_char_map[char] ||= 0
    str2_char_map[char] += 1
  end
  str1_char_map.each do |key, val|
    return false if str2_char_map[key] != val
  end
  true
end

anagrams?('lemon', 'melon')

6. Find the length of the longest substring without repeating characters -

str = 'abcdabefg'

def longest_substring(str)
  start = 0
  max_length = 0
  char_mapper = {}
  str.each_char.with_index do |char, i|
    if char_mapper[char] && char_mapper[char] >= start
      start = char_mapper[char] + 1
    end
    char_mapper[char] = i
    max_length = [max_length, i - start + 1].max
    puts "#{char_mapper}, start = #{start}, max_length = #{max_length} "
  end
  max_length
end

7. Find the longest palindromic substring -

def is_palindrome?(str)
  left = 0
  right = str.length - 1
  while left < right
    return false if str[left] != str[right]
    left += 1
    right -= 1
  end
  true
end

str= "abcbobiracecarhb"

def largest_palindrome_sequence(str)
  start = 0
  finish = 1
  max_length_string = ""
  while start < finish
    if str[start] == str[finish] && is_palindrome?(str[start, finish])
      current_substring = str[start, finish]
      max_length_string = current_substring if current_substring.length > max_length_string.length
      start += 1
      finish = start
      puts max_length_string
    end
    if finish == str.length - 1
      start += 1
    else
      finish += 1
    end
  end
  max_length_string
end

8. Reverse sort an array

def reverse_sort(array)
  reverse_sort_arr = []
  no_of_elements = array.length
  no_of_elements.times do |i|
    max = find_max(array)
    reverse_sort_arr << max
    array.delete(max)
  end
  reverse_sort_arr
end

def find_max(arr)
  max = 0
  arr.each { |ele| max = [max, ele].max }
  max
end

9. Find the maximum product of two integers in an array

def max_product(array)
  first_max_number = find_max(array)
  array.delete(first_max_number)
  second_max_number = find_max(array)
  first_max_number * second_max_number
end

def find_max(array)
  max = 0
  array.each do |ele|
    max = ele if ele > max
  end
  max
end

array = [9, 4, 3, 7, 5]
max_product(array)

10. Two sum problem: Given an array of integers, return indices of the two numbers such that they add up to a specific target

def index_of_number_sum(array, target)
  index_2 = 0
  index_1 = 0
  array.each_with_index do |ele, i|
    if array.include?(target - ele)
      index_2 = array.index(target - ele)
      index_1 = i
      return [index_1, index_2]
    end
  end
end

array = [9, 4, 3, 7, 5, 8]
target = 11
index_of_number_sum(array, target)

11. Move zeroes to the end

def move_zeroes_to_end(array)
  zero_pointer = 0
  right_pointer = array.length - 1
  # iteration_number = 0
  array.each_with_index do |ele, i|
    right_pointer -= 1 until array[right_pointer] != 0
    return array if right_pointer < i
    if ele == 0
      # puts "CurrentArray" + array.inspect
      # puts "Found zero for - " + iteration_number.to_s
      # puts "Current element - " + ele.to_s

      # puts "Right pointer element - " + array[right_pointer].to_s
      array[i] = array[right_pointer]
      # puts array[right_pointer]
      array[right_pointer] = 0
      right_pointer -= 1
      # puts "Afterswap array - " + array.inspect
      # puts "Afterswap right pointer - " + right_pointer.to_s
    end
    # iteration_number += 1
    zero_pointer += 1
  end
  array
end

array = [0, 9, 4, 0, 3, 7,0, 0, 5, 8, 0]
move_zeroes_to_end(array)


12. Group anagrams: Given an array of strings, group anagrams together.

def is_anagram?(first_string, second_string)
  first_char_mapper = {}
  second_char_mapper = {}
  first_string.each_char do |char|
    first_char_mapper[char] ||= 0
    first_char_mapper[char] += 1
  end
  second_string.each_char do |char|
    second_char_mapper[char] ||= 0
    second_char_mapper[char] += 1
  end
  return false if first_char_mapper.keys.length != second_char_mapper.keys.length
  first_char_mapper.each do |char, number|
    return false if second_char_mapper[char] != number
  end
  true
end

def group_anagrams(array)
  grouped_array = []
  array.each do |string|
    next if grouped_array.include?(string)
    grouped_array << string
    anagrams = array.select { |second_string| is_anagram?(string, second_string) }
    grouped_array = grouped_array.union(anagrams)
  end
  grouped_array
end

array = ['lemon', 'silly', 'ear', 'yills', 'bear', 'melon', 'olemn']
group_anagrams(array)


=====================================================

Linked List

class Node
  attr_accessor :data, :next

  def initialize(val)
    @data = val
    @next = nil
  end
end

class LinkedList
  attr_accessor :head

  def initialize(val)
    @head = Node.new(val)
    @head.next = nil
  end

  def print(node)
    node_vals = []
    if !node.next
      node_vals << node.val
    else
      current = node
      while current.next
        node_vals << current.val
        current = node.next
      end
    end
    node_vals.join('->')
  end

  def append(val)
    head = self.head
    node = Node.new(val)
    if !head.next
      head.next = node
    else
      current_node = head.next
      current_node = current_node.next while current_node.next
      current_node.next = node
    end
    head
  end

  def prepend(val)
    head = self.head
    node = Node.new(val)
    node.next = head
    head = node
    head
  end

  def delete(val, position = 1)
    # val = 8
    # position = 2
    current =self.head
    node_counter = 0
    # position = 2
    previous_node = current
    while node_counter != position
      previous_node = node_found?(current, val)
      node_counter += 1
      current = previous_node.next.next
    end
    previous_node.next = previous_node.next.next
    self.head
  end

  def reverse
    previous = nil
    current = self.head
    while current
      current_next = current.next
      current.next = previous
      previous = current
      current = current_next
    end
    self.head = previous
  end

  private

  # returns the previous node of the node to be deleted
  def node_found?(node, val)
    current = node
    until current.next.data == val
      current = current.next
    end
    current
  end


end

delete(8, 2)
input => linked_list = 3 -> 7 -> 8 -> 4 -> 9 -> 7 -> 8 -> 4 -> 6, number = 8, position = 1
output => 3 -> 7 -> 8 -> 4 -> 9 -> 7 -> 4 -> 6


2. Reverse Linked List -

def reverse
  previous = nil
  current = self.head
  while current
    current_next = current.next
    current.next = previous
    previous = current
    current = current_next
  end
  self.head = previous
end

linked_list = LinkedList.new(2)
linked_list.append(8)
linked_list.append(6)
linked_list.append(9)
linked_list.reverse
puts linked_list.print


3. Find the middle of a Linked List

def middle_of_linked_list(list)
  head = list.head
  current = head
  length_of_list = 0
  while current
    length_of_list += 1
    current = current.next
  end
  mid = length_of_list/2
  current = head
  mid.times do |i|
    current = current.next
  end
  current
end

4. Merge two sorted linked lists

def merge_sorted_linked_lists(list1, list2)
  first_head = list1.head
  second_head = list2.head
  first_list_pointer = first_head
  second_list_pointer = second_head
  sorted_list = nil
  if first_head.data > second_head.data
    sorted_list = LinkedList.new(second_head.data)
    second_list_pointer =  second_head.next
  else
    sorted_list = LinkedList.new(first_head.data)
    first_list_pointer = first_head.next
  end
  while second_list_pointer.next && first_list_pointer.next
    if first_list_pointer.data > second_list_pointer.data
      sorted_list.append(second_list_pointer.data)
      second_list_pointer = second_list_pointer.next if second_list_pointer.next
    else
      sorted_list.append(first_list_pointer.data)
      first_list_pointer = first_list_pointer.next if first_list_pointer.next
    end
  end
  sorted_list.tail.next = first_list_pointer.next ? first_list_pointer : second_list_pointer
  sorted_list
end

list1_elements = [2, 5, 6, 8]
list2_elements = [1, 3, 5, 7, 9, 11, 12]
list1 = LinkedList.new(list1_elements.first)
list2 = LinkedList.new(list2_elements.first)
list1_elements.shift
list2_elements.shift
list1_elements.each { |ele| list1.append(ele) }
list2_elements.each { |ele| list2.append(ele) }
puts list1.print
puts list2.print

sorted_list = merge_sorted_linked_lists(list1, list2)
puts sorted_list.print

5. Remove nth node from the end

def remove_last_nth_node(list, position)
  list_length = list.length
  node_index = list_length - position + 1
  if node_index == 1
    list.head = list.head.next
    return list
  end
  current_pos = 1
  current = list.head
  previous = nil
  until node_index == current_pos
    previous = current
    current = current.next
    current_pos += 1
  end
  if current.next
    previous.next = current.next
  else
    previous.next = nil
  end
  list
end

list2_elements = [1, 3, 5, 7, 9, 11, 12]
list2 = LinkedList.new(list2_elements.first)
list2_elements.shift
list2_elements.each { |ele| list2.append(ele) }
puts list2.print

list = remove_last_nth_node(list2, 7)
puts list.print


# Binary trees -

class Node
  attr_accessor :value, :left, :right

  def initialize(value)
    @value = value
    @left = nil
    @right = nil
  end

end

# construct tree -

root = Node.new(1)
root.left = Node.new(2)
root.right = Node.new(3)
root.left.left = Node.new(4)
root.left.right = Node.new(5)
root.right.left = Node.new(6)
root.right.right = Node.new(7)

1. DFS and its types -

# left -> root -> right
def in_order(node)
  return if node.nil?
  in_order(node.left)
  print "#{node.value} "
  in_order(node.right)
end

# root -> left -> right
def pre_order(node)
  return if node.nil?
  print "#{node.value} "
  pre_order(node.left)
  pre_order(node.right)
end

# left -> right -> root
def post_order(node)
  return if node.nil?
  post_order(node.left)
  post_order(node.right)
  print "#{node.value} "
end


def dfs(node)
  return if node.nil?

  print "#{node.value} "
  dfs(node.left)
  dfs(node.right)
end

puts dfs(root)

2. BFS -
# Has to be implemented using queue/array

def level_order(root)
  return if root.nil?
  queue = [root]
  until queue.empty?
    node = queue.shift
    puts node.value
    queue << node.left if node.left
    queue << node.right if node.right
  end
end

level_order(root)

3. Find the height of the tree -

# Example tree:
#     1
#    / \
#   2   3
#  / \
# 4   5

def height(node)
  return -1 if node.nil?
  left_height = height(node.left)
  right_height = height(node.right)
  height = [left_height, right_height].max + 1
end

root = Node.new(1)
root.left = Node.new(2)
root.right = Node.new(3)
root.left.right = Node.new(5)
root.left.left = Node.new(4)

puts height(root)

4. Check if the tree is balanced -

# Example tree:
#     1
#    / \
#   2   3
#  / \
# 4   5

def check_if_balanced?(node)
  return true if node.nil?
  left_height = height(node.left)
  right_height = height(node.right)
  (left_height - right_height).abs <= 1 && check_if_balanced?(node.left) && check_if_balanced?(node.right)
end

5. Check if the binary tree is bst -
# binary search tree has left < root < right

def is_bst?(node, min = -Float::INFINITY, max = Float::INFINITY)
  return true if node.nil?
  return false if node.value <= min || node.value >= max
  is_bst?(node.left, min, node.value) && is_bst?(node.right, node.value, max)
end

============================================

Merge sort -

def merge_sort(array)
  return array if array.length <= 1
  mid = array.length/2
  left_array = merge_sort(array[0...mid])
  right_array = merge_sort(array[mid...array.length])

  merge(left_array, right_array)
end

def merge(left, right)
  sorted = []
  until left.empty? || right.empty?
    if left.first <= right.first
      sorted << left.shift
    else
      sorted << right.shift
    end
  end
  sorted.concat(left).concat(right)
end
