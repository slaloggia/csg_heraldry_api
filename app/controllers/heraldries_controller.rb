class HeraldriesController < ApplicationController

    def create
        member = Member.find_by(member_name)

        if !member
            render json: {error: ["No member found with that name"]}
        else
            heraldry = Heraldry.find_or_create_by(member_id: member.id)
            heraldry.update(heraldry_params)
            if heraldry.valid?
                heraldry.save
                render json: heraldry
            else
                render json: {error: heraldry.errors.full_messages}
            end
        end
    end

    def coat_of_arms
        member = Member.find_by(member_name)
        heraldry = Heraldry.find_by(member_id: member.id)
      
        if heraldry&.coat_of_arms&.attached?
          redirect_to rails_blob_url(heraldry.coat_of_arms)
        else
          head :not_found
        end
    end


    private

    def heraldry_params
        params.require(:heraldry).permit(:colors, :blazon, :motto, :coat_of_arms)
    end


    def member_name
        params.require(:member).permit(:name)
    end
end
