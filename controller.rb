require 'json'

module OrderForm
	class Session
		def initialize(session)
      @session = session
      if (@session[:configuration])
        @configuration = JSON.parse(@session[:configuration], :symbolize_names => true)
      else
         @configuration =  {
          :order => {
            :contact => {},
            :services => {}
          }
        }
      end
      
		end
    
    def add_contact(params)
      @configuration[:order][:contact] = params
      save_session()
    end
    
    def define_services(params)
      params.keys.map {|service| @configuration[:order][:services][service] = {}}
      save_session
    end
    
    def save_service(params)
    
    end
    
    def save_session()
      
      @session['configuration'] = @configuration.to_json
      puts "Session Data:#{@session[:configuration]}"
    end
    

    
	end
	
	class Lookup
		def initialize
		
		end
	end
end