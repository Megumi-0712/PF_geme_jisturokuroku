class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

		has_many :blogs, dependent: :destroy
		has_many :comments, dependent: :destroy
		has_many :favorites, dependent: :destroy
		attachment :profile_image
    paginates_per 10

  validates :name, presence: true,
  			length: { minimum: 4, maximum: 20}
end
