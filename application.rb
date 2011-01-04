# encoding: utf-8

require 'rubygems'
require 'haml'
require 'sinatra/base'

class Application < Sinatra::Base
  configure do
    enable :static

    set :views,  File.join(File.dirname(__FILE__), 'views')
    set :public, File.join(File.dirname(__FILE__), 'public')
  end

  helpers do
    # ...
  end

  not_found do
    haml 'Not found'
  end

  error do
    haml "Error (#{request.env['sinatra.error']})"
  end

  get '/' do
    haml :index
  end
end

