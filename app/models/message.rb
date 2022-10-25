class Message < ApplicationRecord
  default_scope { order(created_at: :desc) }
  belongs_to :room
  validates_presence_of :content, :session_id
end
