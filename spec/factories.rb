FactoryBot.define do
  factory :heraldry do
    association :member, factory: :member
    colors { "purple, blue, black" }
    blazon { "Per bend purpure and azure a raven sable" }
    motto { "Sto testando" }
  end

  factory :member do
    name { "John Smith" }
    guild_name { "Smokey" }
    rank { "Scholar" }
    focus { "Renaissance" }
    joined { 2005 }

    trait :with_coat_of_arms do
        coat_of_arms { fixture_file_upload(Rails.root.join('spec', 'support', 'assets', 'shield.png'), 'image/png') }
    end
  end

    
end