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



  end
end