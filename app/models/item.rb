class Item < ApplicationRecord

  has_many_attached :images
  # belongs_to :user
  # belongs_to :bland
  has_one :delivery, dependent: :destroy
  # belongs_to :category

end
