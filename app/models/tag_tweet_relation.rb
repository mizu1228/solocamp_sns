class TagTweetRelation < ApplicationRecord

  belongs_to :tweet
  belongs_to :tag
end
