require '../BankAccount'
require './AccountProxy'
require './AccountProtectionProxy'

proxy = AccountProxy.new(BankAccount.new(100))
proxy.deposit(25)
proxy.withdraw(50)
puts "account balance is now: #{proxy.balance}"

# Generic virtual proxy
require './VirtualProxy'
array = VirtualProxy.new { Array.new }
array << 'hello'
array << 'out'
array << 'there'

puts array.to_s
