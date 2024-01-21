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

      user = User.find(id)
      assert_equal id, user.id


      ## update name
      user.name = "test"
      assert user.save

      assert_equal id, user.id
      assert_equal "test", user.name

      ## Nothing changed
      assert_equal 26, id.length

      assert_equal 31, user.id_card.length
      assert_equal 33, user.student_number.length
    end
  end
end
