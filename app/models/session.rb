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

class Session < ApplicationRecord
  validates :session_token, presence: true
  belongs_to :user

  def ensure_session_token
    self.session_token ||= SecureRandom.urlsafe_base64(32)
  end

end
