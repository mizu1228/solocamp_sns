class RmoveEmailIndexFromUser < ActiveRecord::Migration[6.0]
  def up
    remove_index :users, :email
    add_index :users, [:email, :soft_destroyed_at], unique: true
  end

  def down
    remove_index :users, [:email, :soft_destroyed_at]
    add_index :users, :email, unique: true
  end
  
end
