class Message < ActiveRecord::Base
  belongs_to :messageboard
  belongs_to :user
  default_scope -> { order('created_at DESC')}
  validates :content, presence: true, length: { maximum: 250 }
end
