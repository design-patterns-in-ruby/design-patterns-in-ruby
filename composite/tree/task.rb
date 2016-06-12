class Task < Node
  def initialize(name, time_required = nil)
    super(name)
    @time_required = time_required
  end

  def time_required
    if leaf?
      @time_required
    else
      time = 0.0
      children.each { |child_task| time += child_task.time_required }
      time
    end
  end
end
