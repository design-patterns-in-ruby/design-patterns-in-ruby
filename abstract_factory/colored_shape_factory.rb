require_relative 'red_circle_factory'
require_relative 'green_square_factory'
require_relative 'blue_rectangle_factory'

class ColoredShapeFactory
  def get_factory(factory_type)
    if %w(RedCircle GreenSquare BlueRectangle).include? factory_type
      self.class.const_get("#{factory_type}Factory").new
    end
  end
end
