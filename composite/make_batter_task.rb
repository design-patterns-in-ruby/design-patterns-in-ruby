class MakeBatterTask < CompositeTask
  def initialize
    super('Make batter')
    @sub_tasks = []
    add_sub_task AddDryIngredientsTask.new
    add_sub_task AddLiquidsTask.new
    add_sub_task MixTask.new
  end
end
