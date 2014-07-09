class Idea < ActiveRecord::Base
	belongs_to :user
	validates :name, presence: true, length: {maximum: 50}
	validates :description, presence: true
	validates :user_id, presence: true
	belongs_to :team
	has_many :requirements
	has_many :skills, through: :requirements
end
