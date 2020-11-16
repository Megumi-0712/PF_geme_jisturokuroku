class Blog < ApplicationRecord

	belongs_to :user
	has_many :comments, dependent: :delete_all
	has_many :favorites, dependent: :destroy

	paginates_per 10

	validates :title, presence: true
	validates :body, presence: true

	def favorited_by?(user)
		favorites.where(user_id: user.id).exists?
	end

#ブログのアーカイブ

	def divide_monthly
		return self.articles.group("strftime('%Y%m', articles.created_at)").order(Arel.sql("strftime('%Y%m', articles.created_at) desc")).count
	end

#ブログのアーカイブここまで
