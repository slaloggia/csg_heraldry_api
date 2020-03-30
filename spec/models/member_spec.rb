require 'rails_helper'

RSpec.describe Member, type: :model do

  describe "Validation" do
    let!(:subject) { create(:member) }

    it "is valid with valid attributes" do
      puts subject
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
    let!(:starting_db_count) { Member.count }
    let!(:subject) { create(:member) }

    it "increases the database count by 1" do
      expect(Member.count).to eq(starting_db_count+1)
    end
  end
end
