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
  after_initialize :ensure_session_token

  def ensure_session_token
    self.session_token ||= SecureRandom.urlsafe_base64(16)
  end

  def reset_session_token!
    self.session_token = SecureRandom.urlsafe_base64(16)
  end

  def remove_session_token
    self.session_token = nil
  end

  def self.get_user_id_by_token( token )
    session = Session.find_by( session_token: token )
    session.user_id unless session.nil?
  end

  def self.sign_out_user( user_id )
    Session.where( user_id: user_id ).destroy_all
  end

  def self.get_user_by_token( token )
    User.find( self.get_user_id_by_token( token ) )
  end
end
