class Restaurant < ApplicationRecord
  has_many :reviews, dependent: :destroy # When a restaurant is deleted, its reviews are deleted too

  validates :name, presence: true
  validates :address, presence: true
  validates :category, presence: true, inclusion: { in: %w[chinese italian japanese french belgian] }
end
