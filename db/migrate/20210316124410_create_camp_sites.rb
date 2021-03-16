class CreateCampSites < ActiveRecord::Migration[6.0]
  def change
    create_table :camp_sites do |t|
      t.string :site, null: false
      t.string :address, null: false
      t.string :site_tell
      t.integer :prefecture_id, null: false
      t.integer :site_type_id, null: false

      t.timestamps
    end
  end
end
