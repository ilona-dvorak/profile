def sum_odd_indexed(array)
  sum = 0
  array.each_with_index do |num, index|
    sum += num if index.odd?
  end
  return sum
end

def even_numbers(array)
  # TODO: Return the even numbers from a list of integers.
  #       You should use Enumerable#select
  array.select do |n|
    n.even?
  end
end

def short_words(array, max_length)
  # TODO: Take an array of words, return the array of words not exceeding max_length characters
  #       You should use Enumerable#reject
  array.reject do |w|
    w.length > max_length
  end
end

def first_under(array, limit)
  # TODO: Return the first number from an array that is less than limit.
  #       You should use Enumerable#find
  array.find do |n|
    n < limit
  end
end

def add_bang(array)
  # TODO: Take an array of strings and return a new array with "!" appended to each string.
  #       You should use Enumerable#map
  array.map do |new_array|
    "#{new_array}!"
  end
end

def concatenate(array)
  # TODO: Concatenate all strings given in the array.
  #       You should use of Enumerable#reduce
  array.reduce(:+)
end

def sorted_pairs(array)
  # TODO: Reorganize an array into slices of 2 elements, and sort each slice alphabetically.
  #       You should use of Enumerable#each_slice
  result = []
  array.each_slice(2) { |a| result << a.sort }
  result
end
