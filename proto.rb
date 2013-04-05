class Proto < Sinatra::Base
  
  Slim::Engine.set_default_options :pretty => true
  
  get '/' do
    slim :index
  end
  
  get '/features' do
    slim :features
  end
  
end