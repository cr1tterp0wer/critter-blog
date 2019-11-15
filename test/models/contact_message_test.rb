# == Schema Information
#
# Table name: contact_messages
#
#  id         :bigint           not null, primary key
#  name       :string
#  email      :string
#  message    :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class ContactMessageTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
