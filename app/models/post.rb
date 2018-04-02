class Post < ApplicationRecord
	has_many :comments
	validates :title, presence: true
	validates :subtitle, presence: false
	validates :body, presence: true
end