class Friendship < ActiveRecord::Base
  after_create :makelovin
  after_destroy :burn_the_damn_bridge

  belongs_to :bumblebee
  belongs_to :friend, class_name: "Bumblebee"
  validate :not_self

  private
  def makelovin
    friend.friendships.create(friend: bumblebee)
  end

  def burn_the_damn_bridge
    friendship = friend.friendships.find_by(friend: bumblebee)
    friendship.destroy if friendship
  end

  def not_self
    errors.add(:friend, "can't be equal to user") if bumblebee == friend
  end
end
