class CreateExhibitions < ActiveRecord::Migration
  def change
    create_table :exhibitions do |t|
      t.string :condition
      t.string :title_pic
      t.string :name
      t.string :name_c
      t.date :period_sta
      t.date :period_end
      t.string :content
      t.string :content_c
      t.timestamps null: false
    end
  end
end
