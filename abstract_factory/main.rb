require_relative 'factory_producer'

factory_producer = FactoryProducer.new
shape_factory = factory_producer.get_factory("SHAPE")

circle = shape_factory.get_shape('CIRCLE');
circle.draw();

rectangle = shape_factory.get_shape('RECTANGLE');
rectangle.draw();

square = shape_factory.get_shape('SQUARE');
square.draw();

color_factory = factory_producer.get_factory("COLOR")

red = color_factory.get_color("RED")
red.fill();

blue = color_factory.get_color("BLUE")
blue.fill();

green = color_factory.get_color("GREEN")
green.fill();