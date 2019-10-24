require "./lib/oyster_card"
require "./lib/station"
require "./lib/journey"

describe Journey do
  let (:oystercard) { Oystercard.new }
  let (:journey) { Journey.new }
  it "keeps track of all journeys" do
    oystercard.top_up(10)
    oystercard.touch_in("station1")
    oystercard.touch_out("station2")
    p journey.journeys
    expect(journey.journeys).to include ["station1", "station2"]
  end

  it "has an empty list of journeys on initialisation" do
    expect(journey.journeys).to be_empty
  end
end
