class Comment < ApplicationRecord
  	belongs_to :post, optional: true
    validates :author, presence: true
    validates :comment, presence: true

end
