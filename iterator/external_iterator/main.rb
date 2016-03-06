require_relative 'array_iterator'

i = ArrayIterator.new(%w(red green blue))
puts "item: #{i.next_item}" while i.has_next?

i = ArrayIterator.new('abc')
puts("item: #{i.next_item}") while i.has_next?
