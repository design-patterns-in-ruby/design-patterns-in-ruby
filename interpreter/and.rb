require_relative 'expression'

class And < Expression
  def initialize(expression1, expression2)
    @expression1 = expression1
    @expression2 = expression2
  end

  def evaluate(dir)
    results1 = @expression1.evaluate(dir)
    results2 = @expression2.evaluate(dir)
    (results1 & results2).sort.uniq
  end
end
