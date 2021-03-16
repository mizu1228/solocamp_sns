class Comment < ApplicationRecord

  validates :comment, presence: true, length: { maximum: 140 }
  with_options presence: true do
    validates :user_id
    validates :tweet_id
  end


  belongs_to :user
  belongs_to :tweet

end
