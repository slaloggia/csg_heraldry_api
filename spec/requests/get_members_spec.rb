require 'rails_helper'

RSpec.describe "GET routes" do

    describe "get all members route", type: :request do
        let!(:members) { create_list(:member, 10) }
        before { get "/members"}

        it "returns all members" do
            expect(JSON.parse(response.body).size).to eq(10)
        end

        it "returns status code 200" do
            expect(response).to have_http_status(:success)
        end


    end

    describe "get one member route", type: :request do
        let!(:members) {create_list(:member, 10)}
        let!(:id) { members.sample.id }
        before { get "/members/#{id}" }

        it "returns status code 200" do
            expect(response).to have_http_status(:success)
        end
        
        it "returns the correct member" do
            expect(JSON.parse(response.body)['name']).to eq(Member.find(id).name)
        end

        it "includes nested Heraldry object" do
            expect(JSON.parse(response.body)).to have_key(:heraldry)
        end

    end
    
end