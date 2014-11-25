
class RelationshipsController < ApplicationController
  def create
      user = User.find(params[:followed_id])
      current_user.follow(user)

      respond_to do |format|
        format.json { render json: Relationship.last.id}
      end
    end

    def destroy
      user = Relationship.find(params[:id]).followed
      current_user.unfollow(user)
      redirect_to user
    end
end