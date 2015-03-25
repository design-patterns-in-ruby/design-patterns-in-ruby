require_relative '../bank_account'
require_relative 'account_proxy'
require_relative 'account_protection_proxy'
require_relative 'virtual_proxy'

proxy = AccountProxy.new(BankAccount.new(100))
proxy.deposit(25)
proxy.withdraw(50)
puts "account balance is now: #{proxy.balance}"

array = VirtualProxy.new { Array.new }
array << 'hello'
array << 'out'
array << 'there'

puts array.to_s
