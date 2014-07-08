class Team < ActiveRecord::Base
	has_and_belongs_to_many :users
	has_many :ideas
	has_many :memberships, dependent: :destroy
	has_many :users, through: :memberships
	has_one :messageboard, dependent: :destroy
	validates :name, presence: true, length: { maximum: 50 },
					uniqueness: { case_sensitive: false }


end

def join_team!(user)
	memberships.create!(user_id: user.id)
end 