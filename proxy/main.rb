# Directly accessing BankAccount
require './BankAccount'
account = BankAccount.new(100)
account.deposit(50)
account.withdraw(10)
puts account.balance

# Protection proxy
require './BankAccountProxy'
protection_proxy = BankAccountProxy.new(account)
protection_proxy.deposit(50)
protection_proxy.withdraw(10)
puts protection_proxy.balance

# Virtual proxy
require './VirtualAccountProxy'
virtual_proxy = VirtualAccountProxy.new { BankAccount.new(10) }
virtual_proxy.deposit(50)
virtual_proxy.withdraw(20)
puts virtual_proxy.balance
