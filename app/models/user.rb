class User < ActiveRecord::Base
  has_many :lists

  validates :name, presence: true
  validates :user_name, presence: true
  has_secure_password

end
