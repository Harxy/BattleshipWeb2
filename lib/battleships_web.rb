require 'sinatra/base'

class BattleshipsWeb < Sinatra::Base
  get '/' do
    # 'Hello BattleshipsWeb!'
    erb :index

  end
  get '/newgame' do
    @name = params[:name]
    erb :newgame
  end
  set :views, proc {File.join(root, '..', 'views')}

  # start the server if ruby file executed directly
  run! if app_file == $0
end
