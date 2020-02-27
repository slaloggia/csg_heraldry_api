FactoryBot.define do
  factory :heraldry do
    colors { "MyString" }
    blazon { "MyString" }
    motto { "MyString" }
    member_id { 1 }
  end

  factory :member do
    name { "MyString" }
    guild_name { "MyString" }
    rank { "MyString" }
    focus { "MyString" }
    joined { 1 }
  end

    
end