def merge(array1, array2)
  merged = []

  iterator1 = ArrayIterator.new(array1)
  iterator2 = ArrayIterator.new(array2)

  while iterator1.has_next? && iterator2.has_next?
    merged << if iterator1.item < iterator2.item
                iterator1.next_item
              else
                iterator2.next_item
              end
  end

  # Pick up the leftovers from array1
  merged << iterator1.next_item while iterator1.has_next?

  # Pick up the leftovers from array2
  merged << iterator2.next_item while iterator2.has_next?

  merged
end
