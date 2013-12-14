module MapsApp
  class Restaurant
    attr_accessor :id, :name
    
    def initialize(attributes = {})
      attributes.each do |name, value|
        send("#{name}=", value)
      end
    end
    
    
  end
end