class CreateVisitedSites < ActiveRecord::Migration[6.0]
  def change
    create_table :visited_sites do |t|
      t.references :camp_site, foreign_key: true, null: false
      t.references :user, foreign_key: true, null: false
      t.references :tweet, foreign_key: true

      t.timestamps
    end
  end
end
