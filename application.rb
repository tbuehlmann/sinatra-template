# encoding: utf-8

require 'rubygems'
require 'pathname'
require 'sinatra/base'

class Application < Sinatra::Base
  configure do
    enable :static
    
    set :views, Pathname.new(__FILE__).dirname.join('views').expand_path
    set :public, Pathname.new(__FILE__).dirname.join('public').expand_path
  end
  
  helpers do
    # ...
  end
  
  not_found do
    haml '404'
  end
  
  error do
    haml "Error (#{request.env['sinatra.error']})"
  end
  
  get '/' do
    haml :index
  end
end
