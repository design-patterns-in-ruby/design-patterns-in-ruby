require_relative 'array_iterator'

i = ArrayIterator.new(['red', 'green', 'blue'])
while i.has_next?
  puts "item: #{i.next_item}"
end

i = ArrayIterator.new('abc')
while i.has_next?
  puts("item: #{i.next_item}")
end
