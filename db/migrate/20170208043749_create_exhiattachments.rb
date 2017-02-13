class CreateExhiattachments < ActiveRecord::Migration
  def change
    create_table :exhiattachments do |t|
      t.string :title
      t.string :title_c
      t.string :pic
      t.string :exhibition_id
      t.string :content
      t.string :content_c
      t.timestamps null: false
    end
  end
end
