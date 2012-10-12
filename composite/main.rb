require './Task'
require './CompositeTask'

require './MakeCakeTask'

require './MakeBatterTask'
require './AddDryIngredientsTask'
require './AddLiquidsTask'
require './MixTask'

require './FillPanTask'
require './BakeTask'
require './FrostTask'

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
