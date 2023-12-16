require_relative 'abstract_factory'
require_relative 'square'
require_relative 'green'

class GreenSquareFactory < AbstractFactory
  def get_shape
    Square.new
  end

  def get_color
    Green.new
  end
end
