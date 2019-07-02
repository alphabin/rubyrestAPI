require 'httparty' 

class ResponseIframe
    
    attr_accessor :url, :iFrameSupported
    
    def initialize urlIn
        @url = urlIn
        @iFrameSupported = false
        @xFrameStatus = ""
        @xXSSProtection= ""
        @serverStat = ""
    end
    
    def setvalid truth
        @iFrameSupported = truth
    end

    def checkURL
        url =  @url
        response = HTTParty.get("https://"+url)
        case response.code
            when 200
                puts "All good!"
                @serverStat = "All good!"
            when 404
                puts "O noes not found!"
                @serverStat = "O noes not found!"
            when 500...600
                puts "ERROR #{response.code}"
                @serverStat = "ERROR #{response.code}";
        end
        res = response.to_json
        puts res
        xFrame = response.response['x-frame-options']
        xXSS = response.response['x-xss-protection']
        puts xFrame.to_s
        puts xXSS.to_s
        if !xFrame.nil? || !xXSS.nil?
            @iFrameSupported = false
            @xFrameStatus = xFrame.to_s
            @xXSSProtection = xXSS.to_s
            
        else
             @iFrameSupported = true
        end
        
        
    end
    
end
 



