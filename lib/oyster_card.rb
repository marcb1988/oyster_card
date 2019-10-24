require './lib/journey'
require './lib/station'

class Oystercard
  attr_reader :balance, :start_station
  MAX_BALANCE = 90
  MINIMUM_FARE = 1

  def initialize
    @journey = Journey.new
    @balance = 0
    @start_station = nil
  end

  def top_up(num)
    fail "Cannot top up more than £90" if @balance + num > MAX_BALANCE
    @balance += num
  end

  private def deduct(num)
    fail "You don't have enough funds" if @balance - num < 0
    @balance -= num
  end

  def touch_in(station)
    fail "You are already registered in journey" if @start_station != nil
    fail "Insufficient Funds" if @balance < 1
    @start_station = station
    @journey.this_journey << @start_station
  end

  def touch_out(station)
    fail "You are not registered as in journey" if @start_station == nil
    deduct(MINIMUM_FARE)
    @start_station = nil
    @journey.this_journey << station
    @journey.journeys << @journey.this_journey
  end

  def in_journey?
    return @start_station != nil
  end
end
