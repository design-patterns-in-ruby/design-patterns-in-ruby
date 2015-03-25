require_relative 'task'
require_relative 'composite_task'

require_relative 'make_cake_task'

require_relative 'make_batter_task'
require_relative 'add_dry_ingredients_task'
require_relative 'add_liquids_task'
require_relative 'mix_task'

require_relative 'fill_pan_task'
require_relative 'bake_task'
require_relative 'frost_task'

cake_batter = MakeBatterTask.new
puts "#{cake_batter.time_required} minutes to make cake batter"

cake = MakeCakeTask.new
puts "#{cake.time_required} minutes to make cake"

# Start at a leaf node and traverse the tree to the root
task = cake[0][0]
while task
  puts "task: #{task}"
  task = task.parent
end
