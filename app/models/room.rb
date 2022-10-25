class Room < ApplicationRecord
  has_many :messages, dependent: :destroy
  validates_presence_of :title, :session_id
end
