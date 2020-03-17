require 'rails_helper'

RSpec.describe Heraldry, type: :model do

  describe "model validations" do
    let(:subject) { create(:heraldry) }
    it "is valid with valid attributes" do
      expect(subject).to be_valid
    end

    it "is invalid without a blazon" do
      subject.blazon = nil
      expect(subject).to_not be_valid
    end
  end

  describe "Association" do
    let(:subject) { create(:heraldry) }
    it { should belong_to(:member).without_validating_presence }
  end

  describe "Attachment" do
    let(:subject) { create(:heraldry, :with_coat_of_arms) }
    it { expect(subject).to be_valid }
  end
end
