class Requirement < ActiveRecord::Base
	belongs_to :ideas
	belongs_to :skills
end
