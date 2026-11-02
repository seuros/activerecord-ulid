# frozen_string_literal: true

require_relative "../test_helper"

module ActiveRecordULID
  class UlidTest < ActiveSupport::TestCase
    def test_ulid_as_string
      user = User.new
      assert_not user.persisted?
      assert user.save

      id = user.id
      assert_equal 26, id.length

      assert_equal 31, user.id_card.length
      assert_equal 33, user.student_number.length

      stored = User.find(id)
      assert_equal [id, user.id_card, user.student_number], [stored.id, stored.id_card, stored.student_number]

      # Updating another column leaves the ULIDs alone
      assert stored.update(name: "test")
      stored.reload

      assert_equal "test", stored.name
      assert_equal [id, user.id_card, user.student_number], [stored.id, stored.id_card, stored.student_number]
    end

    def test_type_instance_gets_a_per_record_default
      model = Class.new(ApplicationRecord) do
        self.table_name = "users"
        attribute :id, ActiveRecordULID::Type.new(prefix: "usr_")
      end

      assert model.new.id.start_with?("usr_")
      assert_not_equal model.new.id, model.new.id
    end

    def test_each_new_record_gets_its_own_ulids
      first = User.new
      second = User.new

      assert_not_equal first.id, second.id
      assert_not_equal first.id_card, second.id_card
      assert_not_equal first.student_number, second.student_number
      assert_equal 2, [User.create!, User.create!].map(&:id).uniq.size
    end

    def test_prefixed_ulids_persist_with_partial_inserts
      model = Class.new(User) do
        def self.name
          "User"
        end

        self.partial_inserts = true
      end
      user = model.create!
      stored = User.find(user.id)

      assert_equal user.id_card, stored.id_card
      assert_equal user.student_number, stored.student_number
      assert stored.id_card.start_with?("user_")
      assert stored.student_number.start_with?("student")
    end

    def test_dup_gets_a_fresh_id
      user = User.create!
      copy = user.dup

      assert_not_equal user.id, copy.id
      assert copy.save
    end

    def test_nullable_ulid_stays_nil
      assert_nil User.create!.reload.nullable_ulid
    end

    def test_explicit_default_is_kept
      model = Class.new(ApplicationRecord) do
        self.table_name = "users"
        attribute :id, :ulid
        attribute :id_card, :ulid, default: "card"
      end

      assert_equal "card", model.new.id_card
    end

    def test_assigning_nil_generates_a_ulid
      user = User.new(id_card: nil)

      assert user.id_card.start_with?("user_")
    end
  end
end
