class MembersController < ApplicationController
    
    def index
        members = Member.all.sort_by {|member| member.joined}
        render json: members
    end

    def show
        member = Member.find(params[:id])
        render json: member
    end

    def create
        member = Member.new(member_params)
        if member.valid?
            member.save
            
        else
            render json: "Something's wrong. Could not save."
        end

        render json: member
    end

    private

    def member_params
        params.require(:member).permit(:name, :guild_name, :joined, :rank, :focus)
    end
end
