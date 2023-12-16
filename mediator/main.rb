require_relative 'stock_offer'
require_relative 'colleague'
require_relative 'gorman_slacks'
require_relative 'jt_poorman'
require_relative 'stock_mediator'

# Stock exchange
nyse = StockMediator.new

# Stock Exchange Brokers
gorman_slack_broker = GormanSlacks.new(nyse)
jt_poorman_broker   = JTPoorman.new(nyse)

# Transactions
gorman_slack_broker.buy_offer('NRG', 10)
jt_poorman_broker.sale_offer('NRG', 10)
gorman_slack_broker.buy_offer('GOOG', 100)
jt_poorman_broker.sale_offer('APPL', 50)

nyse.get_stock_offerings
