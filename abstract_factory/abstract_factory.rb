class AbstractFactory
  def get_color
    raise "must implement get_color() method in subclass"
  end

  def get_shape
    raise "must implement get_shape() method in subclass"
  end
end