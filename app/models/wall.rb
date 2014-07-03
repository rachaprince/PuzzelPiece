class Wall < ActiveRecord::Base
	belongs_to :user
	has_many :posts, 		class_name: "Wallpost"
	validates :user_id, 	presence: true
end
