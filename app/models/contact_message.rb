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

class ContactMessage < ApplicationRecord
  validates :email, :message, :name, presence: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }

end
