class CreateFriendrequests < ActiveRecord::Migration
  def change
    create_table :friendrequests do |t|
      t.text :status, default: "pending"
      t.references :bumblebee, index: true, foreign_key: true
      t.integer :friend_id

      t.timestamps null: false
    end
  end
end
