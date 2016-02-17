class Shoe < ActiveRecord::Base
	belongs_to :user
	has_many :bought, dependent: :destroy
	has_many :users_bought, through: :bought, source: :user
end
