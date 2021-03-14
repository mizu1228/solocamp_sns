class Tag < ApplicationRecord
  has_many :tag_tweet_relations, dependent: :destroy
  has_many :tweets, through: :tag_tweet_relations

  validates :tag_name, uniqueness: true
end
