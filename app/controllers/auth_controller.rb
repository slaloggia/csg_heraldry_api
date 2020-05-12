require './config/secrets/access.rb'

class AuthController < ApplicationController
    def create
        if params[:password] == ADMIN_PASSWORD
            render json: {auth: "Authorized"}
        else
            render json: {auth: "Incorrect Password"}
        end
    end
end