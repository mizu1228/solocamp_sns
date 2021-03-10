class TweetsTag

  include ActiveModel::Model
  attr_accessor :text, :image, :name, :user_id

  with_options presence: true do
    validates :text, length: { maximum: 400 } 
    validates :image
    validates :name
  end


  def save(tag_list)
    tweet = Tweet.create(text: text, image: image, user_id: user_id)

    tag_list.each do |tag_name|
      tag = Tag.where(name: tag_name).first_or_initialize
      tag.save

      TagTweetRelation.create(tweet_id: tweet.id, tag_id: tag.id)
    end
  end

end