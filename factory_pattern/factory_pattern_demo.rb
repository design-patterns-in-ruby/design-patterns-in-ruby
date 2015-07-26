require_relative 'shape_factory'

class FactoryPatternDemo
  
  shape_factory =  ShapeFactory.new
  #get an object of Circle and call its draw method.
  shape1 = shape_factory.get_shape("CIRCLE");

  #call draw method of Circle
  shape1.draw();

  #get an object of Rectangle and call its draw method.
  shape2 = shape_factory.get_shape("RECTANGLE");

  #call draw method of Rectangle
  shape2.draw();

  #get an object of Square and call its draw method.
  shape3 = shape_factory.get_shape("SQUARE");

  #call draw method of circle
  shape3.draw();
end