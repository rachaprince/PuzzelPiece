class Skillset < ActiveRecord::Base
	belongs_to :skills
	belongs_to :users
	validates :user_id, presence: true
	validates :skill_id, presence: true

	
end

