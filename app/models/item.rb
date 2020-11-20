class Item < ApplicationRecord
  with_options presence: true do
    validates :name
    validates :content
    validates :price

    with_options numericality: { other_than: 1 } do
      validates :category_id
      validates :condition_id
      validates :delivery_fee_id
      validates :prefecture_id
      validates :period_id
    end
  end

  belongs_to :user
  has_one_attached :image
end
