class DropCCEScoringGuides < ActiveRecord::Migration
  def change
    # Supplying a block in #drop_table method allows it to be rollbacked
    # in case we want to later on.
    drop_table "cce_scoring_guides", force: :cascade do |t|
      t.string   "description",                         null: false
      t.integer  "criteria",                            null: false
      t.decimal  "points",      precision: 5, scale: 2, null: false
      t.datetime "created_at",                          null: false
      t.datetime "updated_at",                          null: false
    end
  end
end
