class StockMediator
  attr_accessor :colleagues, :stock_buy_offers, :stock_sale_offers, :colleague_codes

  def initialize
    @colleague_codes = 0

    @colleagues        = []
    @stock_buy_offers  = []
    @stock_sale_offers = []
  end

  def add_colleague(colleague)
    colleagues << colleague

    @colleague_codes += 1

    colleague.colleague_code = colleague_codes
  end

  def offer_send(stock, shares, colleague_code, transaction_type)
    stock_status = false
    stock_offers = transaction_type == :buy ? stock_sale_offers : stock_buy_offers

    stock_offers.each do |offer|
      if offer.stock_symbol == stock && offer.stock_shares == shares
        puts "#{shares} shares of #{stock} maked by operation #{transaction_type}, colleague code #{offer.colleague_code}"

        stock_offers.delete(offer)
        stock_status = true
      end

      break if stock_status
    end

    if !stock_status
      puts "#{shares} shares of #{stock} added to inventory"

      new_offering = StockOffer.new(shares, stock, colleague_code)

      send("stock_#{transaction_type}_offers") << new_offering
    end
  end

  def get_stock_offerings
    puts "\n Stocks for Sale"

    stock_sale_offers.each { |offer| puts "#{offer.stock_shares} of #{offer.stock_symbol}" }

    puts "\n Stock buy Offers"

    stock_buy_offers.each { |offer| puts "#{offer.stock_shares} of #{offer.stock_symbol}" }
  end
end
