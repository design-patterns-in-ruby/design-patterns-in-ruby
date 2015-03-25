require './task'
require './composite_task'

require './make_cake_task'

require './make_batter_task'
require './add_dry_ingredients_task'
require './add_liquids_task'
require './mix_task'

require './fill_pan_task'
require './bake_task'
require './frost_task'

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
