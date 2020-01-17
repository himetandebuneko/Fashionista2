class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :tweets
  has_many :comments
  has_many :likes, dependent: :destroy
  has_many :like_tweets, through: :likes, source: :tweet

  validates :nickname, presence: true

  def self.new_guest
    new do |u|
      u.nickname = "Guest"
      u.email    = "guest_#{Time.now.to_i}#{rand(100)}@example.com"
      u.guest    = true
    end
  end

  def move_to(user)
    tweets.update_all(user_id: user.id)
  end
end
