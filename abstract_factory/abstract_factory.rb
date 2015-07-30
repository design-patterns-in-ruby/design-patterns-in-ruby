class AbstractFactory
  def get_color
    raise "must implement getColor() method in subclass"
  end

  def get_shape
    raise "must implement getShape() method in subclass"
  end
end