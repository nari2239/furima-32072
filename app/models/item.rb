class Item < ApplicationRecord
  with_options presence: true do
    validates :name
    validates :content
    validates :price, format: { with: /\A[0-9]+\z/, message: 'is invalid. Input half-width characters.' }
    validates :price, format: { with: greater_than_or_equal_to: 300, message: 'Out of setting range ' }
    validates :price, format: { with: less_than_or_equal_to: 9999999, message: 'Out of setting range ' }

    with_options numericality: { other_than: 1 } do
      validates :category_id
      validates :condition_id
      validates :delivery_fee_id
      validates :prefecture_id
      validates :period_id
    end
  end

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :delivery_fee
  belongs_to :prefecture
  belongs_to :period

  belongs_to :user
  has_one_attached :image
end
