require 'httparty' 

class ResponseIframe
    
    attr_accessor :url, :isValid
    
    def initialize urlIn
        @url = urlIn
        @isValid = false
    end
    
    def setvalid truth
        @isValid = truth
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
        xyz = JSON.parse(res.to_s)['date']
        puts "Header #{xyz}"
        
    end
    
end
 



