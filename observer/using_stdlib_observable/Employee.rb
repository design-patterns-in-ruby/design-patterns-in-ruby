require 'observer'

class Employee
  include Observable

  attr_reader :name, :title
  attr_reader :salary

  def initialize(name, title, salary)
    super()
    @name = name
    @title = title
    @salary = salary
  end

  def salary=(new_salary)
    changed     # Sets boolean flag that object has changed to true
    @salary = new_salary
    notify_observers(self)  # Sets changed = false
  end
end
