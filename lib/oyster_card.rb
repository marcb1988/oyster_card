class Oystercard
  attr_reader :balance
  MAX_BALANCE = 90
  MINIMUM_FARE = 1

  def initialize
    @balance = 0
    @in_journey = false
  end

  def top_up(num)
    fail "Cannot top up more than £90" if @balance + num > MAX_BALANCE
    @balance += num
  end

  private def deduct(num)
    fail "You don't have enough funds" if @balance - num < 0
    @balance -= num
  end

  def touch_in
    fail "You are already registered in journey" if @in_journey == true
    fail "Insufficient Funds" if @balance < 1
    @in_journey = true
  end

  def touch_out
    fail "You are not registered as in journey" if @in_journey == false
    deduct(MINIMUM_FARE)
    @in_journey = false
  end

  def in_journey?
    return @in_journey
  end

end
