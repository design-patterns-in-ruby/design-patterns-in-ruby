class Task
  attr_accessor :parent
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def time_required
    0
  end
end
