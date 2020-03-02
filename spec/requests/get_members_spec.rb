require 'rails_helper'

RSpec.describe "GET routes" do

    before(:all) do
        members = create_list(:member, 10)
    end

    describe "get all members route", type: :request do
        before { get "/members"}

        it "returns all members" do
            expect(JSON.parse(response.body).size).to eq(10)
        end

        it "returns status code 200" do
            expect(response).to have_http_status(:success)
        end

        it "includes nested Heraldry object" do
            expect(JSON.parse(response.body)[0]).to have_key(:heraldry)
        end

    end

    describe "get one member route", type: :request do
        
    end
    
end