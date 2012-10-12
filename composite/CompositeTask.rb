class CompositeTask < Task
  def initialize(name)
    super(name)
    @sub_tasks = []
  end

  def add_sub_task(task)
    @sub_tasks << task
    task.parent = self
  end

  alias :<< :add_sub_task

  def remove_sub_task(task)
    @sub_tasks.delete(task)
    task.parent = nil
  end

  def [](index)
    @sub_tasks[index]
  end

  def []=(index, value)
    replaced_value = @sub_tasks[index]
    @sub_tasks[index] = value
    replaced_value.parent = nil
    value.parent = self
  end

  def time_required
    time = 0.0
    @sub_tasks.each { |task| time += task.time_required }
    time
  end
end
