require_relative 'subject'
require_relative '../employee'

fred = Employee.new('Fred Flintstone', 'Crane Operator', 30000)
fred.add_observer do |changed_employee|
  puts "Cut a new check for #{changed_employee.name}!"
  puts "His salary is now #{changed_employee.salary}!"
end

fred.salary = 35000
