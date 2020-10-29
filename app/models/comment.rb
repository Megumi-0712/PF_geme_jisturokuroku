class Comment < ApplicationRecord

	belongs_to :user
	belongs_to :blog

	validates :comment_post, presence: true

	paginates_per 20
end
