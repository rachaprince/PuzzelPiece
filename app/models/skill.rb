class Skill < ActiveRecord::Base
	has_many :skillsets
	has_many :users, through: :skillsets
	validates :name, presence: :true 
end
