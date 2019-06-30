require 'httparty' 

class ResponseIframe
    
    attr_accessor :url, :iFrameSupported
    
    def initialize urlIn
        @url = urlIn
        @iFrameSupported = false
    end
    
    def setvalid truth
        @iFrameSupported = truth
    end
    
    def to_json
        obj = {}
        instance_variables.map do |var|
            obj[var] = instance_variable_get(var)
        end
        JSON.dump(obj)
    end
    
    def checkURL
        url =  @url
        response = HTTParty.get("https://"+url)
        case response.code
            when 200
                puts "All good!"
            when 404
                puts "O noes not found!"
            when 500...600
                puts "ZOMG ERROR #{response.code}"
        end
        res = response.to_json
        puts res
        xFrame = response.response['x-frame-options']
        xXSS = response.response['x-xss-protection']
        puts xFrame.to_s
        puts xXSS.to_s
        if !xFrame.nil? || !xXSS.nil?
            @iFrameSupported = false
        else
             @iFrameSupported = true
        end
        
        
    end
    
end
 



