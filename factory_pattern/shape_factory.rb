require_relative "circle"
require_relative "rectangle"
require_relative "square"

class ShapeFactory

  #use getShape method to get object of type shape
  def get_shape(type)

    return case type
      when "CIRCLE"
        Circle.new
      when "RECTANGLE"
        Rectangle.new
      when "SQUARE"
        Square.new
      else
        nil
    end
  end

end