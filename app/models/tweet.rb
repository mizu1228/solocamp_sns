class Tweet < ApplicationRecord

  belongs_to :user
  has_one_attached :image
  has_many :tag_tweet_relations, dependent: :destroy
  has_many :tags, through: :tag_tweet_relations

  after_create do
    tweet = Tweet.find_by(id: self.id)
    tags = self.text.scan(/[#＃][\w\p{Han}ぁ-ヶｦ-ﾟー]+/)
    tweet.tags = []
    tags.uniq.map do |hashtag|
      tag = Tag.find_or_create_by(tag_name: hashtag.downcase.delete('#＃'))
      tweet.tags << tag
    end
  end

  before_update do
    tweet = Tweet.find_by(id: self.id)
    tweet.tags.clear
    tags = self.text.scan(/[#＃][\w\p{Han}ぁ-ヶｦ-ﾟー]+/)
    tags.uniq.map do |hashtag|
      tag = Tag.find_or_create_by(tag_name: hashtag.downcase.delete('#＃'))
      tweet.tags << tag
    end
  end

end
