class Post < ApplicationRecord
  belongs_to :category

  validates :title, :description, :photos, presence: true #photos?

  has_many_attached :photos
end
