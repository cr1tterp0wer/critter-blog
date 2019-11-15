# == Schema Information
#
# Table name: posts
#
#  id         :bigint           not null, primary key
#  user_id    :bigint
#  title      :string
#  body       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Post < ApplicationRecord
  has_one_attached :cover_picture
  validates :title, :body, presence: true

end
