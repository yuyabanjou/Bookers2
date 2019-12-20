class Book < ApplicationRecord
	validates :title, presence: true
	validates :body, presence: true
	validates :body, length: { in: 0..200 },allow_nil: true

	belongs_to :user

end
