class RestaurantController < UIViewController
  attr_accessor :restaurant

  def initWithRestaurant(restaurant)
    initWithNibName(nil, bundle:nil)
    self.restaurant = restaurant
    self
  end

  def viewDidLoad
    super

    self.title = self.restaurant["name"]
    self.view.backgroundColor = UIColor.whiteColor

    @restaurant_info = UILabel.alloc.init
    @restaurant_info.lineBreakMode = UILineBreakModeWordWrap
    @restaurant_info.numberOfLines = 0
    @restaurant_info.frame = [[0, 0], [view.frame.size.width, view.frame.size.height + 30]]
    @restaurant_info.text = "#{self.restaurant['name']} is the closest taco place! It's located at #{self.restaurant['location']['display_address'].join(" ")}"
    @restaurant_info.sizeToFit
    @restaurant_info.center = CGPointMake(self.view.frame.size.width / 2, self.view.frame.size.height / 4)
    self.view.addSubview @restaurant_info

  end


end