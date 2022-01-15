class Recipe < ApplicationRecord
  belongs_to :user
  has_many :favorites, dependent: :destroy
  attachment :image
  with_options presence: true do
    validates :title
    validates :body
    validates :image
  end
end
