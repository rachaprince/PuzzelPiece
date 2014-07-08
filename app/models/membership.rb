class Membership < ActiveRecord::Base
	belongs_to :user
	belongs_to :team
	validates :team_id, presence: true
	validates :user_id, presence: true
end
