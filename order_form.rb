require 'sinatra/base'
require 'json'
require_relative 'controller'


module OrderForm 
	class Ui < Sinatra::Base
    enable :sessions
    

  
    get '/' do
      
      erb :contact
      
    end

    post '/contact' do
      data  = OrderForm::Session.new(session)
      data.add_contact(params[:contact])
      
      services = ["Compute-as-a-Service","Storage-as-a-Service","Cloud Foundry","Sync-and-Share","Email and Collaboration"]
      erb :services, :locals => {'services' => services}
      
    end
    
    post '/services' do
      data  = OrderForm::Session.new(session)
      data.define_services(params[:services])
      
      services = ["Compute-as-a-Service","Storage-as-a-Service","Cloud Foundry","Sync-and-Share","Email and Collaboration"]
      #erb :services, :locals => {'services' => services}
      
    end
  end
end
  
      

