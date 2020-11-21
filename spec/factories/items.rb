FactoryBot.define do
  factory :item do
    name            {Faker::Commerce.product_name}
    content         {Faker::Lorem.sentence}
    category_id     {2}
    condition_id    {2}
    delivery_fee_id {2}
    prefecture_id   {2}
    period_id       {2}
    price           {Faker::Commerce.price(range: 300..10000).to_i}
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
