class Colleague
  attr_accessor :colleague_code

  def initialize(mediator)
    @mediator = mediator

    @mediator.add_colleague(self)
  end

  def sale_offer(stock, shares)
    @mediator.offer_send(stock, shares, @colleague_code, :sale)
  end

  def buy_offer(stock, shares)
    @mediator.offer_send(stock, shares, @colleague_code, :buy)
  end
end
