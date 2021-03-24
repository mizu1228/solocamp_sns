class CreateInteres < ActiveRecord::Migration[6.0]
  def change
    create_table :interes do |t|
      t.references :user, foreign_key: true, null: false
      t.references :camp_site, foreign_key: true, null: false

      t.timestamps
    end
  end
end
