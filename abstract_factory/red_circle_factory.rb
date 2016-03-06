require_relative 'abstract_factory'
require_relative 'circle'
require_relative 'red'

class RedCircleFactory < AbstractFactory
  def get_shape
    Circle.new
  end

  def get_color
    Red.new
  end
end
