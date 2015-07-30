require_relative 'color_factory'
require_relative 'shape_factory'

class FactoryProducer
  def get_factory(choice)
    case choice
      when 'SHAPE' then ShapeFactory.new
      when 'COLOR' then ColorFactory.new
      else nil
    end
  end

end