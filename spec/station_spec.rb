require "./lib/station"

describe Station do
  let (:station) { Station.new }

  it "creates and instance of the Station Class" do
    expect(station).to be_instance_of (Station)
  end

  it "has two variables: name and zone" do
    expect(station.name).not_to be nil
    expect(station.zone).not_to be nil
  end
end
