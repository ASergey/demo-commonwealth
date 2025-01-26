# frozen_string_literal: true

FactoryBot.define do
  factory :author do
    sequence(:firstname) { |n| "Имя #{n}" }
    sequence(:lastname) { |n| "Фамилия #{n}" }
  end
end
