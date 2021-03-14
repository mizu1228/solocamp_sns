class TweetsTag

  include ActiveModel::Model
  attr_accessor :text, :image, :tag_name, :user_id

  with_options presence: true do
    validates :text, length: { maximum: 400 } 
    validates :image
  end

  validates :tag_name, length: { maximum: 99 }

  delegate :persisted?, to: :tweet


  def initialize(attributes = nil, tweet: Tweet.new)
    @tweet = tweet
    attributes ||= default_attributes
    super(attributes)
  end

  def save
    ActiveRecord::Base.transaction do
      @tweet.update(text: text, image: image, user_id: user_id)
    end
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
      user_id: tweet.user_id
    }
  end

end