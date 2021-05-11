class SongsController < ApplicationController
  def index
    render json: Song.all.as_json
  end

  def show
    render json: Song.find(params[:id]).as_json
  end

  def create
    song = Song.new(
      title: params[:title],
      album: params[:album],
      artist: params[:artist],
      year: params[:year],
      link: params[:link]
    )
    song.save
    render json: song.as_json
  end

  def update
    song = Song.find(params[:id])
    song.title = params[:title] || song.title
    song.album = params[:album] || song.album
    song.artist = params[:artist] || song.artist
    song.year = params[:year] || song.year
    song.link = params[:link] || song.link
    song.save
    render json: song.as_json
  end

  def destroy
    song = Song.find(params[:id])
    song.delete
    render json: {message: "Song successfully deleted"}
  end
end
