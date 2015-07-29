class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :uploader
      t.string :url
      t.string :caption
      t.references :bumblebee, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
