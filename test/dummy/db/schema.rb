# frozen_string_literal: true

ActiveRecord::Schema[8.1].define(version: 1) do
  create_table "users", id: :string, force: :cascade do |t|
    t.string "name"
    t.string "id_card"
    t.string "student_number"
    t.string "nullable_ulid"
    t.timestamps
  end
end
