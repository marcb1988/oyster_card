class Oystercard
  attr_reader :balance
  MAX_BALANCE = 90

  def initialize
    @balance = 0
  end

  def top_up(num)
    fail "Cannot top up more than £90" if @balance + num > MAX_BALANCE
    @balance += num
  end

  def deduct(num)
    fail "You don't have enough funds" if @balance - num < 0
    @balance -= num
  end
end
