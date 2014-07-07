class Team < ActiveRecord::Base
	has_and_belongs_to_many :users

	validates :name, presence: true, length: { maximum: 50 },
					uniqueness: { case_sensitive: false }

	def addMember(user) 
		@team.users << user
	end

end
