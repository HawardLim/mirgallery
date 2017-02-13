class CreateMainpics < ActiveRecord::Migration
  def change
    create_table :mainpics do |t|
      t.string :pic1
      t.string :pic2
      t.string :pic3
      t.string :pic4
      t.string :pic5
      t.string :pic6
      t.timestamps null: false
    end
  end
end
