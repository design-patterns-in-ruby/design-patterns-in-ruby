class StockOffer
  attr_accessor :stock_shares, :stock_symbol, :colleague_code

  def initialize(stock_shares, stock_symbol, colleague_code)
    @stock_shares   = stock_shares
    @stock_symbol   = stock_symbol
    @colleague_code = colleague_code
  end
end
