require "oyster_card"
require "./lib/station"
require "./lib/journey"

describe Oystercard do
  let(:oystercard) { Oystercard.new }
  let(:journey) {Journey.new}

  it "creates and instance of Oystercard" do
    expect(oystercard).to be_instance_of Oystercard
  end

  it "has a default balance of 0" do
    expect(oystercard.balance).to eq 0
  end

  it "can top up the balance" do
    oystercard.top_up(10)
    expect(oystercard.balance).to eq 10
  end

  it 'cannot be topped up beyond the max £90' do
    oystercard.top_up(90)
    expect{oystercard.top_up(1)}.to raise_error "Cannot top up more than £90"
  end

  it "can tell if you are in a journey or not" do
    expect(oystercard.in_journey?).to eq(true).or eq(false)
  end

  it "can track when you touch in and go on a journey" do
    oystercard.top_up(10.00)
    oystercard.touch_in("station1")
    expect(oystercard.in_journey?).to be true
  end

  it "can track when you touch out and are no longer on a journey" do
    oystercard.top_up(10.00)
    oystercard.touch_in("station1")
    oystercard.touch_out("station2")
    expect(oystercard.in_journey?).to be false
  end

  it "prevents touching in if balance is less than the minimum fare" do
    expect{oystercard.touch_in("station1")}.to raise_error "Insufficient Funds"
  end

  it "deducts funds on touch out to pay for Journey" do
    oystercard.top_up(10.00)
    oystercard.touch_in("station1")
    expect{oystercard.touch_out("station2")}.to change{oystercard.balance}.by(-1)
  end

  it "tracks the touch in station" do
    oystercard.top_up(10)
    oystercard.touch_in("station1")
    expect(oystercard.start_station).to eq "station1"
  end
end