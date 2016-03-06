require_relative 'colored_shape_factory'

colored_shape_factory = ColoredShapeFactory.new

red_circle_factory = colored_shape_factory.get_factory('RedCircle')
puts 'Red Circle Factory'
red_circle_factory.get_shape.draw
red_circle_factory.get_color.fill
puts

green_square_factory = colored_shape_factory.get_factory('GreenSquare')
puts 'Green Square Factory'
green_square_factory.get_shape.draw
green_square_factory.get_color.fill
puts

blue_rectangle_factory = colored_shape_factory.get_factory('BlueRectangle')
puts 'Blue Rectangle Factory'
blue_rectangle_factory.get_shape.draw
blue_rectangle_factory.get_color.fill
