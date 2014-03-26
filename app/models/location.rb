class Location
  PROPERTIES = [:longitude, :latitude]
  PROPERTIES.each { |prop|
    attr_accessor prop 
  }

  def initialize(attributes = {})
    attributes.each {|key, value|
      self.send("#{key}=", value) if PROPERTIES.member? key
    }
  end
end