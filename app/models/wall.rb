class Wall < ActiveRecord::Base
	belongs_to :user
	has_many :wallposts
	validates :user_id, presence: true
end
