require 'sinatra/base'
require 'battleships'

class BattleshipsWeb < Sinatra::Base
  get '/' do
    erb :index

  end
  post '/newgame' do
    $game = Game.new Player, Board
    session[:name] = params[:name]

    erb :newgame
  end

  get '/startgame' do
    @board = $game.own_board_view $game.player_1
    erb :startgame
  end

  get '/place' do
    erb :startgame
  end

  post '/place' do
    $game.player_1.place_ship(Ship.send( params[:ship_type]), 
                                         params[:coords], 
                                         params[:direction])

    redirect '/place'
  end

  post '/start_attacking' do

    erb :start_attacking
  end

  post '/attack' do
    @result = $game.player_2.shoot(params[:coords].to_sym)
    erb :attack
  end

  set :views, proc {File.join(root, '..', 'views')}

  # start the server if ruby file executed directly
  run! if app_file == $0
end
