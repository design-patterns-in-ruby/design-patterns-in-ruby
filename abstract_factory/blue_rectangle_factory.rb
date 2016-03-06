require_relative 'abstract_factory'
require_relative 'rectangle'
require_relative 'blue'

class BlueRectangleFactory < AbstractFactory
  def get_shape
    Rectangle.new
  end

  def get_color
    Blue.new
  end
end
