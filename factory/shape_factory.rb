require_relative 'circle'
require_relative 'rectangle'
require_relative 'square'

class ShapeFactory
  # Use getShape method to get object of type shape.
  def get_shape(type)
    case type
    when 'Circle'    then Circle.new
    when 'Rectangle' then Rectangle.new
    when 'Square'    then Square.new
    end
  end
end
