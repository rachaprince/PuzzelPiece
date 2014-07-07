class Team < ActiveRecord::Base
	has_and_belongs_to_many :users
	has_one :messageboard
	validates :name, presence: true, length: { maximum: 50 },
					uniqueness: { case_sensitive: false }


end
