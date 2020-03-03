require 'rails_helper'

RSpec.describe "POST route" do

    context "member does not exist" do
        it "returns an error" do
            post "/heraldry", params: {username: "Jane Doe", blazon: "per bend purpure and azure a raven sable", motto: "I am"}
            expect(response.body).to eq("No member found with that name")
        end
    end

    context "member does not have existing heraldry" do
        before do
            member= create(:member)
            post "/heraldry", params: {username: member.name, blazon: "per bend purpure and azure a raven sable", motto: "I am"}
        end
        it "returns a created status" do
            expect(response).to have_http_status(:created)
        end

        it "adds a new Heraldry instance to the database" do
            expect(Heraldry.count).to eq(starting_db_count + 1)
        end
    end

    context "member has existing heraldry" do
        before do
            start_heraldry = create(:heraldry, :with_coat_of_arms) 
            member = start_heraldry.member
            post "/heraldry", params: {username: member.name, blazon: "murrey a bundle of arrows argent", motto: "I am new"}
        end
        it "updates member's heraldry" do
            expect(member.heraldry.motto).to eq("I am new")
        end
    end
end
