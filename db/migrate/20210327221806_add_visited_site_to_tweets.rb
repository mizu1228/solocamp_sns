class AddVisitedSiteToTweets < ActiveRecord::Migration[6.0]
  def change
    add_reference :tweets, :camp_site, foreign_key: true
  end
end
