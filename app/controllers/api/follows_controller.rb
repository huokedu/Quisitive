class Api::FollowsController < ApplicationController
  before_action :ensure_logged_in

  def index
    @follows = Follow.where(follower_id: current_user.id);
    render "api/follows/index"
  end

  def create
    @follow = Follow.new(
      follower_id: current_user.id,
      followable_type: follow_params[:followable_type],
      followable_id: follow_params[:followable_id]
    )
    if @follow.save
      render "api/follows/show"
    else
      render json: @follow.errors,  status: 422
    end
  end

  def destroy

    @follow = Follow.find(params[:id])
    if @follow.destroy
      render "api/follows/show"
    else
      render json: @follow.errors, status: 422
    end
  end

  private
  def follow_params
    params.require(:follow).permit(:followable_id, :followable_type)
  end

end
