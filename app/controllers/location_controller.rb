class LocationController < UIViewController
  def viewDidLoad
    super

    self.title = "Taco911"
    self.view.backgroundColor = UIColor.whiteColor
    @subhead = UILabel.alloc.initWithFrame(CGRectZero)
    @subhead.text = "This is a taco emergency, okay?"
    @subhead.sizeToFit
    @subhead.center = CGPointMake(self.view.frame.size.width / 2, self.view.frame.size.height / 6)
    self.view.addSubview @subhead


  end
end