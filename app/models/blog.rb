class Blog < ApplicationRecord

	belongs_to :user
	has_many :comments, dependent: :delete_all
	has_many :favorites, dependent: :destroy

	validates :title, presence: true
	validates :blog_text, presence: true

	def favorited_by?(user)
		favorites.where(user_id: user.id).exists?
	end
end
