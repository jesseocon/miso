require 'cgi'
module MapsApp
  class Place
    attr_accessor :next_page_token, :type 
    KEY = 'AIzaSyDtThQbrB58P4El_FpBzzEQifeMsjpJk6I'
    LONGITUDE = -118.430575
    LATITUDE = 33.959192
    BASE_URL = 'https://maps.googleapis.com/maps/api/place/nearbysearch/json'
    
    def initialize(attributes = {})
      attributes.each do |name, value|
        send("#{name}=", value)
      end
    end
    
    def key
      CGI::escape(KEY.to_s)
    end
  
    def longitude
      CGI::escape(LONGITUDE.to_s)
    end
  
    def latitude
      CGI::escape(LATITUDE.to_s)
    end
    
    def place
      "#{self.latitude},#{self.longitude}"
    end
    
    def type
      @type.to_s
    end
    
    def base_url
      BASE_URL
    end
    
    def next_page
      CGI::escape(@next_page_token.to_s)
    end
    
    def full_url
      "#{self.base_url}#{self.prams}"
    end
  
    def request
      response = HTTParty.get(self.full_url)
    end
    
    def prams
      "?location=#{self.place}&radius=5000&sensor=false&key=#{self.key}&next_page_token#{self.next_page_token}&types=#{self.type}"
    end
  end
end

