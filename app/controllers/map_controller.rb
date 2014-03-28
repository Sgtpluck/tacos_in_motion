class MapController < UIViewController
  attr_accessor :location, :latitude, :longitude, :location_manager

  def initWithLocation(location_manager, restaurant)
    initWithNibName(nil, bundle:nil)
    self.latitude = location_manager.location.coordinate.latitude
    self.longitude = location_manager.location.coordinate.longitude
    @restaurant = restaurant
    self
  end

  def viewDidLoad
    @mapView = MKMapView.alloc.initWithFrame(view.bounds)
    @mapView.setShowsUserLocation(true)
    view.addSubview @mapView
    @coordinate = CLLocationCoordinate2D.new(self.latitude, self.longitude)
    setRegion(@coordinate)
    set_restaurant_pin(@restaurant)
    @mapView.delegate = self
  end

  def mapView(mapView, regionDidChangeAnimated: animated)
    set_restaurant_pin mapView.centerCoordinate
  end

  def set_restaurant_pin(restaurant)
    # Pin.new(restaurant).place_on_map
  end

  def setRegion(coordinate)
    @span    = MKCoordinateSpan.new(0.01, 0.01)
    @region  = MKCoordinateRegion.new(coordinate, @span)
    @mapView.setRegion(@region, animated: "YES")
  end

end
