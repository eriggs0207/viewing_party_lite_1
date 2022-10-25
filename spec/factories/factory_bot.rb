# frozen_string_literal: true

FactoryBot.define do
  factory :user, class: User do
    name { Faker::Name.name }
    email { Faker::Internet.email }
    password {Faker::Internet.password(min_length: 10, max_length: 20, mix_case: true, special_characters: true)}
  end

  factory :party, class: Party do
    date { Faker::Date.between(from: Date.today, to: 1.month.from_now) }
    duration { Faker::Number.within(range: 20..200) }
    movie_id { Faker::Number.within(range: 1..1000) }
    start_time { Faker::Time.between_dates(from: Date.today - 1, to: Date.today, period: :morning) }
  end

  factory :user_parties, class: UserParty do
    association :user, factory: :user
    association :party, factory: :party
  end
end
