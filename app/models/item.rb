class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping
  belongs_to :prefecture
  belongs_to :days_to_ship

  with_options numericality: { other_than: 0, message: "can't be blank" } do
    validates :category_id
    validates :condition_id
    validates :shipping_id
    validates :prefecture_id
    validates :days_to_ship_id
  end

  with_options presence: true do
    validates :image
    validates :name
    validates :description
    validates :price,
              numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999,
                              message: 'is out of setting range' }
  end

  validates :price, numericality: { only_integer: true, message: 'is invalid. Input half-width characters' }
end
