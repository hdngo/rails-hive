class Bumblebee < ActiveRecord::Base
  has_many :photos
  validates :username, presence: true
  validates :email, presence: true
  validates :password, presence: true
  # validates :username, :email, uniqueness: true
  validates :username, length: { minimum: 3 }
end
