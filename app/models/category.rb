class Category < ApplicationRecord
  belongs_to :parent, class_name: :Category
  has_many :children, class_name: :Category, foreign_key: :parent_id
  # has_ancestry
end
