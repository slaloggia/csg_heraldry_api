require 'rails_helper'

RSpec.describe Member, type: :model do
  subject {
    described_class.new(
      name: "John Smith",
      guild_name: "Smokey",
      joined: 2000,
      rank: "Scholar",
      focus: "Renaissance"
    )
  }
  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end

  it "is invalid without a name" do
    subject.name = nil
    expect(subject).to_not be_valid 
  end

  it "is invalid without a rank" do
    subject.rank = nil
    expect(subject).to_not be_valid
  end

  it "is invalid with an invalid rank" do
    subject.rank = "Beginner"
    expect(subject).to_not be_valid
  end

  it "is invalid with an invalid focus" do
    subject.focus = "Shortsword"
    expect(subject).to_not be_valid
  end
end
