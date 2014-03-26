class MapController < UIViewController
  attr_accessor :latitude, :longitude, :location_manager

  def initWithLocation(location_manager)
    initWithNibName(nil, bundle:nil)
    self.latitude = location_manager.location.coordinate.latitude
    self.longitude = location_manager.location.coordinate.longitude
    self
  end
  
  def loadView
    self.view = MKMapView.alloc.init
    view.delegate = self
  end

  def viewDidLoad
    view.frame = self.view.bounds

    region = MKCoordinateRegionMake(CLLocationCoordinate2D.new(self.latitude, self.longitude), MKCoordinateSpanMake(0.01, 0.01))
    self.view.setRegion(region)

  end
end