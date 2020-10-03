def sum_with_for(min, max)
  sum = 0
  # CONSTRAINT: you should use a for..end structure
  for num in (min..max)
    sum = sum + num
  end
  if min > max
    return -1
  else
    return sum
  end
end

puts sum_with_for(1, 5)
def sum_with_while(min, max)
  # CONSTRAINT: you should use a while..end structure
  counter = min
  sum = 0
  while counter <= max
    sum += counter
    counter += 1
  end
  if min > max
    return -1
  else
    return sum
  end
end
