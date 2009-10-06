%w{rubygems sinatra haml}.each {|gem| require gem}

configure do
  set :views, "#{File.dirname(__FILE__)}/views"
end

get '/' do
  haml :index
end

not_found do
  haml 'Not found'
end

error do
  haml "Error (#{request.env['sinatra.error'].to_s})"
end

helpers do
end
