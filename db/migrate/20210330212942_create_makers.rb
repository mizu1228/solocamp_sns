class CreateMakers < ActiveRecord::Migration[6.0]
  def change
    create_table :makers do |t|
      t.string :maker_name, null: false, uniqueness: true

      t.timestamps
    end
  end
end
