class HeraldriesController < ApplicationController

    def create
        member = Member.find_by(member_name)

        if !member
            render json: "No member found with that name"
        elsif member.heraldry  
            heraldry = Heraldry.find(member.heraldry.id)
            heraldry.update(heraldry_params)
            heraldry.save
            heraldry.coat_of_arms.attach(params[:heraldry][:image])
            render json: heraldry
        else
            heraldry = Heraldry.new(heraldry_params)
            
            heraldry.member_id = member.id
            if heraldry.valid?
                heraldry.save
            end
            heraldry.coat_of_arms.attach(params[:heraldry][:image])
            render json: heraldry 
        end
    end

    def update

    end

    private

    def heraldry_params
        params.require(:heraldry).permit(:colors, :blazon, :motto, :image)
    end

    def member_name
        params.require(:member).permit(:name)
    end
end
