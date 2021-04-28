FactoryBot.define do
  factory :board do
    name { 'テストを書く' }
    description { 'RSpec & Capybara & FactoryBotを準備' }
    user
  end
end
