class Song < ActiveRecord::Base
	belongs_to :playlist_selection
	has_many :playlists, through: :playlist_selection
end
