ActiveRecord::Schema[7.0].define(version: 2025_01_22_022316) do
  create_table "reservations", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "phone"
    t.datetime "date"
    t.text "message"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
