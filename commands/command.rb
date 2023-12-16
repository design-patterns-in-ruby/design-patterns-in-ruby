class Command
  attr_reader :description

  def initialize(description)
    @description = description
  end

  def execute
    raise NotImplementedError
  end

  def unexecute
    raise NotImplementedError
  end
end
