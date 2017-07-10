require_relative 'circle'
require_relative 'rectangle'
require_relative 'square'

class ShapeFactory
  # use getShape method to get object of type shape
  def get_shape(type)
     Object.const_get("#{type.to_s}").new
  end
end
