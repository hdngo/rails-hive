class Friendrequest < ActiveRecord::Base
  belongs_to :bumblebee
  belongs_to :friend, :class_name => "Bumblebee"

  validates :user, presence: true
  validates :friend, presence: true, uniqueness: { scope: :bumblebee }
  validate :not_self
  validate :not_friends
  validate :not_pending

  def accept
    bumblebee.friends << friend
    destroy
  end


  private

  def not_self
    errors.add(:friend, "can't be equal to bumblebee") if bumblebee == friend
  end

  def not_friends
    errors.add(:friend, 'is already added') if bumblebee.friends.include?(friend)
  end

  def not_pending
    errors.add(:friend, 'already requested friendship') if friend.pending_friends.include?(bumblebee)
  end
end
