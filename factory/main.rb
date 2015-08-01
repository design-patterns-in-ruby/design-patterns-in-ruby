require_relative 'shape_factory'

shape_factory = ShapeFactory.new

circle = shape_factory.get_shape('CIRCLE')
circle.draw

rectangle = shape_factory.get_shape('RECTANGLE')
rectangle.draw

square = shape_factory.get_shape('SQUARE')
square.draw
