class Tweet < ApplicationRecord

  with_options presence: true do
    validates :text, length: { maximum: 400 } 
    validates :image
  end

  belongs_to :user
  has_one_attached :image
end
