class AddDryIngredientsTask < Task
  def initialize
    super('Add dry ingredients')
  end

  def time_required
    1     # 1 minute to add flour and sugar
  end
end
