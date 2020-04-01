require 'rails_helper'

RSpec.describe Member, type: :model do
  let!(:starting_db_count) { Member.count }
  let!(:subject) { create(:member) }
  
  describe "Validation" do
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

  describe "Saves to the database" do
    it "increases the database count by 1" do
      expect(Member.count).to eq(starting_db_count+1)
    end
  end
end
