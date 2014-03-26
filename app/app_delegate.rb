class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    @window.makeKeyAndVisible

    controller = FoodController.alloc.initWithNibName(nil, bundle:nil)
    home_controller = UINavigationController.alloc.initWithRootViewController(controller)

     @window.rootViewController = home_controller

    true
  end
end
