class CreateExhis < ActiveRecord::Migration
  def change
    create_table :exhis do |t|
      t.string :title
      t.string :title_c
      t.string :pic
      t.date :period_sta
      t.integer :artist_id
      t.date :period_end
      t.timestamps null: false
    end
  end
end
