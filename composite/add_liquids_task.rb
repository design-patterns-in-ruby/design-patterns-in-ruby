class AddLiquidsTask < Task
  def initialize
    super('Add liquid ingredients.')
  end

  def time_required
    1.5   # 1.5 minutes to add liquids
  end
end
