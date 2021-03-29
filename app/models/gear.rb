class Gear < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  with_options presence: true do
    validates :user_id
    validates :gear_name
  end
  validates :gear_genre_id, numericality: { other_than: 0 }

  belongs_to :gear_genre
  belongs_to :user
  belongs_to :tweet, optional: true
  has_one_attached :image
end
