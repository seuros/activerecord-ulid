# frozen_string_literal: true

class User < ApplicationRecord
  attribute :id, :ulid
  attribute :id_card, :ulid, prefix: "user_"
  attribute :student_number, :ulid, prefix: :student
end
