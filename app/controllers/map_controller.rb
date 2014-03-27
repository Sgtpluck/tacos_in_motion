class MapController < UIViewController
  attr_accessor :location, :latitude, :longitude, :location_manager

  def initWithLocation(location_manager)
    initWithNibName(nil, bundle:nil)
    @location = location_manager
    self.latitude = location_manager.location.coordinate.latitude
    self.longitude = location_manager.location.coordinate.longitude
    self
  end
  
  def loadView
    self.view = MKMapView.alloc.init
    self.view.setShowsUserLocation(true)
    view.delegate = self
  end

  def viewDidLoad
    view.frame = self.view.bounds

    region = MKCoordinateRegionMake(CLLocationCoordinate2D.new(self.latitude, self.longitude), MKCoordinateSpanMake(0.01, 0.01))
    self.view.setRegion(region)
    # @user = MKPinAnnotationView.alloc.initWithAnnotation(CLLocationCoordinate2D.new(self.latitude, self.longitude), reuseIdentifier:nil)
    # p @user
    # @user.canShowCallout = true
    # @user.animatesDrop = true
    # @user
  end
end