require 'rails_helper'

RSpec.describe "POST heraldries route" do

    context "member does not exist" do
        it "returns an error" do
            post "/heraldries", params: {member: {name: "Jane Doe"}, heraldry: {blazon: "per bend purpure and azure a raven sable", motto: "I am"}}
            expect(response.body).to eq("No member found with that name")
        end
    end

    context "member does not have existing heraldry" do
        let!(:starting_db_count) {Heraldry.count}
        let!(:member) {create(:member)}
        before {post "/heraldries", params: {heraldry: {blazon: "per bend purpure and azure a raven sable", motto: "I am"}, member: {name: member.name}}}

        it "returns a successful status" do
            expect(response).to have_http_status(200)
        end

        it "adds a new Heraldry instance to the database" do
            expect(Heraldry.count).to eq(starting_db_count + 1)
        end

        it "belongs to the member" do
            expect(member.heraldry.motto).to eq("I am")
        end
    end

    context "member has existing heraldry" do
        let!(:start_heraldry) { create(:heraldry, :with_coat_of_arms) }
        let!(:member) { start_heraldry.member }
        before { post "/heraldries", params: { heraldry: {blazon: "murrey a bundle of arrows argent", motto: "I am new"}, member: {name: member.name} } }
       
        it "updates member's heraldry" do
            expect(member.heraldry.motto).to eq("I am new")
        end
    end
end
