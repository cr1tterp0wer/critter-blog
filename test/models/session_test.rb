# == Schema Information
#
# Table name: sessions
#
#  id            :bigint           not null, primary key
#  user_id       :bigint
#  session_token :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

require 'test_helper'

class SessionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
