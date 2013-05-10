class Application < Sinatra::Base
  configure do
    enable :static

    set :views, File.join(File.dirname(__FILE__), 'views')
    set :public_folder, File.join(File.dirname(__FILE__), 'public')

    use Rack::Deflater
    register Sinatra::Kittens
  end

  configure :development do
    use BetterErrors::Middleware
    BetterErrors.application_root = settings.root

    set :slim, :pretty => true
  end

  helpers do
    # …
  end

  error do
    slim "h1 Error (#{request.env['sinatra.error']})"
  end

  get '/' do
    slim :index
  end
end
