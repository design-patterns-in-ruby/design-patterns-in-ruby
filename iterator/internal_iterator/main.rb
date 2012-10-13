# a = [10, 20, 30]

# require './for_each_element'
# for_each_element(a) { |element|
#   puts "The element is #{element}"
# }

# a.each { |element|
#   puts "The element is #{element}"
# }

a = ['joe', 'sam', 'george']
# the 'all' method is provided to Array by the Enumerable module
puts a.all? { |element| element.length < 4 }

