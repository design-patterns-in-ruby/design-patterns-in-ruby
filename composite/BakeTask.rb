class BakeTask < Task
  def initialize
    super('Bake the cake.')
  end

  def time_required
    42.0   # 42 minutes
  end
end
