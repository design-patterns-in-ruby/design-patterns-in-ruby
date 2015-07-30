require_relative 'red'
require_relative 'green'
require_relative 'blue'
require_relative 'abstract_factory'

class ColorFactory < AbstractFactory

  def get_shape(type)
  end

  #use get_color method to get object of type Color
  def get_color(color)
    case color
      when 'RED'     then Red.new
      when 'GREEN'   then Green.new
      when 'BLUE'    then Blue.new
      else nil
    end
  end
end
