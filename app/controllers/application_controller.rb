class ApplicationController < Sinatra::Base

  set :default_content_type, 'application/json'

  get '/' do
    { message: "Hello world" }.to_json
  end

  get '/games' do
    # below gathers all out games objects and sets them to a variable
    games = Game.all
    # then we convert the data to JSON format 
    games.to_json
  end

  get '/games/:id' do
    # params hash would look like { "id" => "10"}
    # using the params we can dynamically look up a game
    game = Game.find(params[:id])

    # we can pass an additional piece which includes these things in 
    # our return json data
    game.to_json(include: {reviews: {include: :user} })
  end

end
