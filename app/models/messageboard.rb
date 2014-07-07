class Messageboard < ActiveRecord::Base
	belongs_to :team 
	has_many :messages
	validates :team_id, presence: true
end
