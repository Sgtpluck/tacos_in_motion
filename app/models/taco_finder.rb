class TacoFinder
  def self.find(location_hash)
    options = { latitude: location_hash.location.coordinate.latitude, longitude: location_hash.location.coordinate.longitude }
    BW::HTTP.post("http://www.taco911.me/taco.json", { payload: options }) do |response|
      p response.body.to_str
      # for now, pass nil.
    end
  end
end