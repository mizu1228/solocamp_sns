class Tweet < ApplicationRecord

  belongs_to :user
  has_one_attached :image
  has_many :tag_tweet_relations, dependent: :destroy
  has_many :tags, through: :tag_tweet_relations

end
