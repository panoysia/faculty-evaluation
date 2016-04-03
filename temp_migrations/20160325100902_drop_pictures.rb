class DropPictures < ActiveRecord::Migration
  def up
    drop_table :pictures
  end

  def down
    create_table "pictures", force: :cascade do |t|
      t.string   "name",           null: false
      t.integer  "imageable_id"
      t.string   "imageable_type"
      t.datetime "created_at",     null: false
      t.datetime "updated_at",     null: false
    end
  end
  
end
