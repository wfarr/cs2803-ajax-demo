require 'demo/init'
require 'sinatra/base'
require 'demo/models'

class Demo < Sinatra::Base
  get '/' do
    @genres = Genre.all
    @top = Song.where("score > 0").order("score desc").limit(10)
    erb :index
  end

  get '/artists' do
    @artists = Artist.where(:genre_id => params[:genre_id])
    @artists.to_json
  end

  get '/songs' do
    @songs = Song.where(:artist_id => params[:artist_id])
    @songs.to_json
  end

  post '/vote' do
    @song = Song.find(params[:song_id])
    @song.score = @song.score + 1
    if @song.save
      redirect '/'
    else
      return [500, "Couldn't find your song!"]
    end
  end
end