class CreateArtists < ActiveRecord::Migration
  def change
    create_table :artists do |t|
      t.string :name
      t.string :name_c
      t.string :bio
      t.string :bio_c
      t.string :title_pic
      t.timestamps null: false
    end
  end
end
