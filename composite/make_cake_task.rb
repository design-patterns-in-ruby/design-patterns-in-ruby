class MakeCakeTask < CompositeTask
  def initialize
    super('Make cake')
    @sub_tasks = []
    self << MakeBatterTask.new
    self << FillPanTask.new
    self << BakeTask.new
    self << FrostTask.new
  end
end
