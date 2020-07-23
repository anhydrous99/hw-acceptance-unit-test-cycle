FactoryBot.define do
  factory :movie, class: Movie do
    title { 'The Matrix' }
    rating { 'R' }
    description { 'This is a great movie' }
    release_date { '1999-03-31' }
  end
end
