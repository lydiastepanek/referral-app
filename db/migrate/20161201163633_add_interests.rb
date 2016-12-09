class AddInterests < ActiveRecord::Migration
  def change
    create_table :interests do |t|
      t.string :name, null: false
      t.integer :user_id, null: false
    end
  end
end
