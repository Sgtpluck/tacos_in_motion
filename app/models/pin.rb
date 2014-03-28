class Pin
  attr_accessor :name, :address, :marker, :latitude, :longitude, :address

  def initialize(hash)
    @name = hash["name"]
    @latitude = hash['geometry']['location']['lat']
    @longitude = hash['geometry']['location']['lng']
    @marker = nil
    @id = hash['id']
    @address = hash['vicinity']

  end

  def place_on_map(map)
    @map ||= map
    @marker = MKPointAnnotation.alloc.init
    @marker.setCoordinate CLLocationCoordinate2D.new(latitude, longitude)

    @pin_view = MKPinAnnotationView.alloc.initWithAnnotation(@marker, reuseIdentifier:nil)

    # @pin_view.animatesDrop = true
    @map.addAnnotation @marker
    @marker.setTitle name
    @marker.setSubtitle @address
  end

end
