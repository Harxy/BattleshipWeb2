require 'sinatra/base'
require 'battleships'
require 'pp'
class BattleshipsWeb < Sinatra::Base
  get '/' do
    # 'Hello BattleshipsWeb!'
    erb :index

  end
  post '/newgame' do
    $game = Game.new Player, Board
    @name = params[:name]
    erb :newgame
  end

  get '/startgame' do
    erb :startgame

  end

  post '/place' do
  @coords = params[:coords]
  @direction = params[:direction]
  $game.player_1.place_ship(Ship.battleship, @coords, @direction)
  erb :place
  end
  set :views, proc {File.join(root, '..', 'views')}

  # start the server if ruby file executed directly
  run! if app_file == $0
end
