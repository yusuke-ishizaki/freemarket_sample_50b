class Product < ActiveRecord::Base
    belongs_to :user
    belongs_to :bland
    has_one :delivery, dependent: :destroy
    accepts_nested_attributes_for :delivery
    belongs_to :category
    has_many_attached :images
    extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to_active_hash :prefecture
    belongs_to_active_hash :size
    belongs_to_active_hash :status
    belongs_to_active_hash :fee
end
