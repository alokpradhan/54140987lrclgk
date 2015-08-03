class PlaylistsController < ApplicationController

  def index
    @playlists = Playlist.all
  end

  def new
  	@playlist = Playlist.new
  	@playlist.songs.build
  end

  def create
  	@playlist = Playlist.new(whitelist_params)
  	if @playlist.save
  		flash[:success] = "playlist created"
  		redirect_to playlists_path
  	else
  		flash.now[:error] = "playlist NOT created"
  		render :new
  	end
  end

private

def whitelist_params
	params.require(:playlist).permit(:name, :user_id, {:songs_attributes => [:song_ids => []]})
end

end
