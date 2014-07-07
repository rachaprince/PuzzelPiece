class Message < ActiveRecord::Base
  belongs_to :messageboard
  default_scope -> { order('created_at DESC')}
end
