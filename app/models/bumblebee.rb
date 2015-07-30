class Bumblebee < ActiveRecord::Base
  has_many :photos
  has_many :friendrequests, dependent: :destroy
  has_many :pending_friends, through: :friendrequests

  has_many :friendships, dependent: :destroy
  has_many :friends, through: :friendships

  validates :username, presence: true
  validates :email, presence: true
  validates :password, presence: true
  # validates :username, :email, uniqueness: true
  validates :username, length: { minimum: 3 }

  def remove_friend(friend)
    current_user.friends.destroy(friend)
  end

end
