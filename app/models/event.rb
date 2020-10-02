class Event < ApplicationRecord
    belongs_to :user, optional: true
    # validates :user_id, presence: true
end
