FactoryBot.define do
  factory :user do
    nickname { 'test' }
    email { Faker::Internet.free_email }
    password { 'test1234' }
    password_confirmation { password }
    last_name { '鈴木' }
    first_name { '一郎' }
    last_name_kana { 'スズキ' }
    first_name_kana { 'イチロウ' }
    birth_date { '1930-01-01' }
  end
end
