class TacoFinder
  def self.find(location_hash)
    options = { latitude: location_hash.location.coordinate.latitude, longitude: location_hash.location.coordinate.longitude }
    BW::HTTP.post("http://www.taco911.me/taco.json", { payload: options }) do |response|
      result_data = BW::JSON.parse(response.body.to_str)
      p result_data
      # for now, pass nil.
    end
  end
end