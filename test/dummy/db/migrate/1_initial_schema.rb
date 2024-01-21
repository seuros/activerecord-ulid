# frozen_string_literal: true

class InitialSchema < ActiveRecord::Migration[7.1]
  def up
    create_table :users, id: :string do |t|
      t.string :name
      t.string :id_card
      t.string :student_number
      t.string :nullable_ulid
      t.timestamps null: false
    end
  end
end
