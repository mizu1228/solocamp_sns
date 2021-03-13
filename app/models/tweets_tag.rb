class TweetsTag

  include ActiveModel::Model
  attr_accessor :text, :image, :tag_name, :user_id

  with_options presence: true do
    validates :text, length: { maximum: 400 } 
    validates :image
    # validates :tag_name
  end

  delegate :persisted?, to: :tweet

  def initialize(attributes = nil, tweet: Tweet.new)
    @tweet = tweet
    attributes ||= default_attributes
    super(attributes)
  end

  def save(tag)
  
    ActiveRecord::Base.transaction do
      @tweet.update(text: text, image: image, user_id: user_id)

      current_tags = @tweet.tags.pluck(:tag_name) unless @tweet.tags.nil?
      old_tags = current_tags - tag
      new_tags = tag - current_tags

      old_tags.each do |old_name|
        @tweet.tags.delete Tag.find_by(tag_name: old_name)
      end

      new_tags.each do |new_name|
        tweet_tag = Tag.find_or_create_by(tag_name: new_name)
        @tweet.tags << tweet_tag
        tweets_tag_relation = TagTweetRelation.where(tweet_id: @tweet.id, tag_id: tweet_tag.id).first_or_initialize
        tweets_tag_relation.update(tweet_id: @tweet.id, tag_id: tweet_tag.id)
      end
    end
    # tweet = Tweet.create(text: text, image: image, user_id: user_id)

    # tag_list.each do |tag_name|
    #   tag = Tag.where(name: tag_name).first_or_initialize
    #   tag.save

    #   TagTweetRelation.create(tweet_id: tweet.id, tag_id: tag.id)
    # end
  end

  def to_model
    tweet
  end

  private

  attr_reader :tweet, :tag

  def default_attributes
    {
      text: tweet.text,
      image: tweet.image,
      user_id: tweet.user_id,
      tag_name: tweet.tags.pluck(:tag_name).join(",")
    }
  end

end