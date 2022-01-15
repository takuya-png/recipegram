class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  attachment :profile_image
  has_many :recipes, dependent: :destroy
  has_many :favorites, dependent: :destroy
  validates :username, presence: true

  def already_favorited?(recipe)
    self.favorites.exists?(recipe_id: recipe.id)
  end
end