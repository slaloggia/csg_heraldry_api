class HeraldriesController < ApplicationController

    def create
        member = Member.find_by(member_name)

        if !member
            render json: "No member found with that name"
        else
            heraldry = Heraldry.find_or_create_by(member_id: member.id)
            heraldry.update(heraldry_params)
            if heraldry.valid?
                heraldry.save
            end
            heraldry.coat_of_arms.attach(params[:heraldry][:image])
            render json: heraldry 
        end
    end


    private

    def heraldry_params
        params.require(:heraldry).permit(:colors, :blazon, :motto, :image)
    end

    def member_name
        params.require(:member).permit(:name)
    end
end
