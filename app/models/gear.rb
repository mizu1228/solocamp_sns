class Gear < ApplicationRecord

  with_options presence: true do
    validates :gear_genre_id
    validates :user_id
    validates :gear_name
  end

  belongs_to :gear_genre
  belongs_to :user
  belongs_to :tweet, optional: true
end
