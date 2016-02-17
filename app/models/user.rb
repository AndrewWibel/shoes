class User < ActiveRecord::Base
	has_many :shoes
	has_many :bought, dependent: :destroy
	has_many :shoes_bought, through: :bought, source: :shoe
  has_secure_password
  validates :first_name, :last_name, :email, :password, :presence => :true
  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  validates :email, uniqueness: { case_sensitive: false }, format: { with: EMAIL_REGEX }
end
