class Wallpost < ActiveRecord::Base
  belongs_to :wall
  belongs_to :user
  default_scope -> { order('created_at DESC') }
end
