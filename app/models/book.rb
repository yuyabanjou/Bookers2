class Book < ApplicationRecord
	validates :title, presence: true
	validates :body, presence: true
	validates :body, length: { in: 0..200 }

	belongs_to :user

end
