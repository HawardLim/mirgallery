class CreateExhiAttachments < ActiveRecord::Migration
  def change
    create_table :exhi_attachments do |t|
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
