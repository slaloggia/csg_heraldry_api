
class AuthController < ApplicationController
    def create
        if params[:password] == ENV["ADMIN_PASSWORD"]
            render json: {auth: "Authorized"}
        else
            render json: {auth: "Incorrect Password"}
        end
    end
end