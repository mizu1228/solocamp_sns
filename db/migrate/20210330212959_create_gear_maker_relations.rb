class CreateGearMakerRelations < ActiveRecord::Migration[6.0]
  def change
    create_table :gear_maker_relations do |t|
      t.references :gear, foreign_key: true, null: false
      t.references :maker, foreign_key: true, null: false

      t.timestamps
    end
  end
end
