class FoodController < UIViewController
  def viewDidLoad
    super

    self.title = "Taco911"
    self.view.backgroundColor = UIColor.whiteColor
    @subhead = UILabel.alloc.initWithFrame(CGRectZero)
    @subhead.text = "This is a taco emergency, okay?"
    @subhead.sizeToFit
    @subhead.center = CGPointMake(self.view.frame.size.width / 2, self.view.frame.size.height / 6)
    self.view.addSubview @subhead

    @taco_button =  UIButton.buttonWithType(UIButtonTypeRoundedRect)
    @taco_button.setTitle("Find tacos!", forState:UIControlStateNormal)
    @taco_button.setTitle("Finding Tacos!", forState:UIControlStateDisabled)
    @taco_button.sizeToFit
    @taco_button.center = CGPointMake(self.view.frame.size.width/2, self.view.frame.size.height / 4)
    self.view.addSubview @taco_button

    @taco_button.when(UIControlEventTouchUpInside) do
        @taco_button.enabled = false

        @location_manager ||= CLLocationManager.alloc.init.tap do |lm|
            lm.delegate = self
        end
        @location_manager.startUpdatingLocation
        TacoFinder.find(@location_manager) do |taco_place|
            @taco_button.enabled = true
            self.display_tacos(taco_place)
        end
    end
  end

  def display_tacos(restaurant)
    self.navigationController.pushViewController(RestaurantController.alloc.initWithRestaurant(restaurant), animated:true)
  end
end
