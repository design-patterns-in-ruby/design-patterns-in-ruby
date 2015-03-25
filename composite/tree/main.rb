require_relative 'node'
require_relative 'task'

make_cake = Task.new('Make cake')

make_batter = Task.new('Make Batter')
make_batter.add_child Task.new('Add Dry Ingredients', 1)
make_batter.add_child Task.new('Add Wet Ingredients', 1.5)
make_batter.add_child Task.new('Mix', 3)

make_cake.add_child make_batter
make_cake.add_child Task.new('Fill pan', 2.5)
make_cake.add_child Task.new('Bake', 42)
make_cake.add_child Task.new('Frost', 3)

# puts make_cake.children.map(&:name)

puts make_cake.time_required
puts make_batter.time_required

# puts make_cake[0].leaf?
# puts make_cake[0].name
# puts make_cake[1].time_required


