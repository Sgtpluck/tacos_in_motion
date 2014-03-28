class Pin
  attr_accessor :name, :address, :marker, :latitude, :longitude

  def initialize(hash)
    @name = hash["name"]
    @address = (hash['location']['display_address'])
    # @url = hash[]
  end

  def place_on_map(map=nil)
    @map ||= map
    @marker = MKPointAnnotation.alloc.init
    @marker.setCoordinate
  end

end
