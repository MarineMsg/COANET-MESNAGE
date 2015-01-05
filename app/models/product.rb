class Product < ActiveRecord::Base
  belongs_to :user
  validates :user_id, presence: true
  validates :name_product, presence: true, length: { maximum: 50 }
  validates :date, presence: true

end
