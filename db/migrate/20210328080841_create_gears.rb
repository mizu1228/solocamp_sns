class CreateGears < ActiveRecord::Migration[6.0]
  def change
    create_table :gears do |t|
      t.integer    :gear_genre_id, null: false
      t.string     :gear_name,     null: false
      t.string     :explanation
      t.references :user,          foreign_key: true, null: false
      t.references :tweet,         foreign_key: true

      t.timestamps
    end
  end
end
