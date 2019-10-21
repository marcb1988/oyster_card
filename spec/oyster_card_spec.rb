require "oyster_card"

describe Oystercard do
  let(:oystercard) { Oystercard.new }

  it "creates and instance of Oystercard" do
    expect(oystercard).to be_instance_of Oystercard
  end

  it "has a default balance of 0" do
    expect (oystercard.balance).to eq 0
  end
end
