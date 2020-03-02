FactoryBot.define do
  factory :heraldry do
    association :member, factory: :member
    colors { 3.times {Faker::Color.color_name}.join(', ') }
    blazon { Faker::Lorem.words(number: 8).join(', ')}
    motto { "Sto testando" }

        trait :with_coat_of_arms do
            coat_of_arms { fixture_file_upload(Rails.root.join('spec', 'support', 'assets', 'shield.png'), 'image/png') }
        end
    end

  factory :member do
    name { Faker::TvShows::GameOfThrones.character }
    guild_name { Faker::Movies::LordOfTheRings.character }
    rank { "Scholar" }
    focus { "Renaissance" }
    joined { [2000...2020].sample }
  end

    
end