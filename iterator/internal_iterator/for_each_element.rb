def for_each_element(array)
  # Make a deep copy the array so that changes to the original array
  # wont effect the iterator
  array_copy = array.clone
  i = 0
  while i < array_copy.length
    yield array_copy[i]
    i += 1
  end
end
