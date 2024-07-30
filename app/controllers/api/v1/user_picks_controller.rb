class Api::V1::UserPicksController < ApplicationController
  before_action :set_user_pick, only: %i[show update destroy]

  def index
    @user_picks = UserPick.all
    render json: @user_picks
  end

  def show
    render json: @user_pick
  end

  def create
    @user_pick = UserPick.new(user_pick_params)
    if @user_pick.save
      render json: @user_pick, status: :created
    else
      render json: @user_pick.errors, status: :unprocessable_entity
    end
  end

  def update
    if @user_pick.update(user_pick_params)
      render json: @user_pick
    else
      render json: @user_pick.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @user_pick.destroy
    head :no_content
  end

  private

  def set_user_pick
    @user_pick = UserPick.find(params[:id])
  end

  def user_pick_params
    params.require(:user_pick).permit(:user_id, :match_id, :predicted_winner_id)
  end
end