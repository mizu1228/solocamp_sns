class Tag < ApplicationRecord
  has_many :tag_tweet_relations
  has_many :tweets, through: :tag_tweet_relations

  validates :name, uniqueness: true
end
