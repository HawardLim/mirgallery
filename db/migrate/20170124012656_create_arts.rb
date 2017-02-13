class CreateArts < ActiveRecord::Migration
  def change
    create_table :arts do |t|
      t.string :title
      t.string :title_c
      t.string :year
      t.string :name
      t.string :name_c
      t.string :pic
      t.string :material
      t.string :size
      t.integer :artist_id
      t.integer :exhibition_id
      t.timestamps null: false
    end
  end
end
