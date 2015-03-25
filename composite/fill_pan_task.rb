class FillPanTask < Task
  def initialize
    super('Fill the pan with cake batter.')
  end

  def time_required
    2.5   # 3 minutes
  end
end
