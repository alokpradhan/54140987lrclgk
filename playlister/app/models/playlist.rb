class Playlist < ActiveRecord::Base
	belongs_to :user
	belongs_to :playlist_selection
	has_many :songs, through: :playlist_selection
	# accepts_nested_attributes_for :user
	accepts_nested_attributes_for :songs, 
																:reject_if => :all_blank, 
																:allow_destroy => :true
end
