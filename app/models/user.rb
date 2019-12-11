class User < ApplicationRecord
  has_many :user_videos
  has_many :videos, through: :user_videos

  has_many :friendships, class_name: 'Friendship', foreign_key: 'user_id', dependent: :destroy
  has_many :occurances_as_friend, class_name: 'Friendship', foreign_key: 'friend_id', dependent: :destroy

  validates :email, uniqueness: true, presence: true
  validates_presence_of :first_name
  enum role: %i[default admin]
  has_secure_password

  def bookmarked_segments
    videos.joins(:tutorial)
          .group('tutorials.id, videos.id')
          .order('tutorials.id, videos.position')
  end
end
