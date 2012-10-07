require './Employee'
require './Payroll'
require './TaxMan'

fred = Employee.new('Fred Flintstone', 'Crane Operator', 30000)

payroll = Payroll.new
fred.add_observer(payroll)

tax_man = TaxMan.new
fred.add_observer(tax_man)

# Give Fred a raise
fred.salary = 35000
