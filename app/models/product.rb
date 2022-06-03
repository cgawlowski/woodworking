class Product < ApplicationRecord
  validates :name, presence: true
  has_many_attached :photos
end
