require_relative 'account'
require_relative 'portfolio'

portfolio = Portfolio.new
portfolio.add_account Account.new('red', 2000)
portfolio.add_account Account.new('blue', 1000)
portfolio.add_account Account.new('green', 500)

puts portfolio.any? { |account| account.balance > 2000 }
puts portfolio.all? { |account| account.balance >= 10 }
