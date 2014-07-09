class Skill < ActiveRecord::Base
	has_many :skillsets
	has_many :users, through: :skillsets
	validates :name, presence: :true 
	has_many :requirements
	has_many :ideas, through: :requirements
end
