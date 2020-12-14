class Post < ApplicationRecord
  belongs_to :category

  validates :title, :description, presence: true

  has_one_attached :photos
end
