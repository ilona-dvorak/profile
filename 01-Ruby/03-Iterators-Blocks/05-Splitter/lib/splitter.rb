def size_splitter(array, size)
  # TODO: Return an array of two arrays, the first containing
  #       words of length `size`, the second containing all the other words
  #       In addition to this split, each array should be *sorted*.
  a1 = []
  a2 = []
  array.each do |othword|
    othword.length == size ? a1.push(othword) : a2.push(othword)
  end
  return [a1.sort, a2.sort]
end

def block_splitter(array)
  # TODO: Return an array of two arrays, the first containing
  #       elements for which the given block yields true,
  #       the second containing all the other elements.
  #       No sort needed this time.
  a1 = array.select { |x| yield(x) }
  a2 = array - a1
  return [a1, a2]
end
