require_relative 'shape_factory'

shape_factory = ShapeFactory.new

circle = shape_factory.get_shape('Circle')
circle.draw

rectangle = shape_factory.get_shape('Rectangle')
rectangle.draw

square = shape_factory.get_shape('Square')
square.draw
