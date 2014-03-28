class RestaurantController < UIViewController
  attr_accessor :restaurant, :location

  def initWithRestaurant(restaurant, location)
    initWithNibName(nil, bundle:nil)
    self.restaurant = restaurant
    self.location = location
    self
  end

  def viewDidLoad
    super

    self.title = self.restaurant["name"]
    self.view.backgroundColor = UIColor.whiteColor

    @restaurant_info = UILabel.alloc.init
    @restaurant_info.lineBreakMode = UILineBreakModeWordWrap
    @restaurant_info.numberOfLines = 0
    @restaurant_info.frame = [[0, 0], [view.frame.size.width - 50, view.frame.size.height + 30]]
    @restaurant_info.text = "#{self.restaurant['name']} is the closest taco place! It's located at #{self.restaurant['location']['display_address'].join(" ")}"
    @restaurant_info.sizeToFit
    @restaurant_info.center = CGPointMake(self.view.frame.size.width / 2, self.view.frame.size.height / 3)
    self.view.addSubview @restaurant_info

    @map_button = UIButton.buttonWithType(UIButtonTypeRoundedRect)
    @map_button.setTitle("Map it!", forState:UIControlStateNormal)
    @map_button.sizeToFit
    @map_button.center = CGPointMake(self.view.frame.size.width/2, self.view.frame.size.height / 5)
    self.view.addSubview @map_button

    @map_button.when(UIControlEventTouchUpInside) do
        self.display_map(self.location, self.restaurant)
    end


  end

  def display_map(location, restaurant)
    self.navigationController.pushViewController(MapController.alloc.initWithLocation(location, restaurant), animated:true)
  end

end