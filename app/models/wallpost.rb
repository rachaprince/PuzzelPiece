class Wallpost < ActiveRecord::Base
	belongs_to :user
	belongs_to :wall
	default_scope -> { order('created_at DESC') } 
	validates :content, presence: true, length: { maximum: 140 }
	validates :user_id, presence: true

	def self.from_users_followed_by(user)
    followed_user_ids = "SELECT followed_id FROM relationships
                         WHERE follower_id = :user_id"
    where("user_id IN (#{followed_user_ids})",
          user_id: user.id)
  end 
end
