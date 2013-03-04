class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.integer :product_id
      t.string :title
      t.text :description

      t.timestamps
    end
  end
end
