class CreateFormats < ActiveRecord::Migration
  def change
    create_table :formats do |t|
      t.string :title
      t.text :description

      t.timestamps
    end
  end
end
