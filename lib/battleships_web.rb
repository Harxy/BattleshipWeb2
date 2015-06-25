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
    @board = $game.own_board_view $game.player_1
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

--------------------------
       2 USERS GAME
--------------------------

get '/' do
    erb :index2
end

post '/registration' do
  
  session[:player] = player_1
  session[:name  ] = params[:name] 

  erb :newgame2
end

get '/start_new_game' do
  $game = Game.new Player, Board

  @board_1          = $game.own_board_view( $game.player_1)
  @opponent_board_1 = $game.opponent_board_view $game.player_1

  erb :start_game2
end

get '/join_game' do
  session[:player]  = player_2
  session[:name]    = params[:name]
  @board_2          = $game.own_board_view( $game.player_2 )
  @opponent_board_2 = $game.opponent_board_view $game.player_2
  
  erb :start_game2
end
   


