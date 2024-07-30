class Api::V1::GroupPicksController < ApplicationController
  before_action :set_group_pick, only: %i[show update destroy]

  def index
    @group_picks = GroupPick.all
    render json: @group_picks
  end

  def show
    render json: @group_pick
  end

  def create
    @group_pick = GroupPick.new(group_pick_params)
    if @group_pick.save
      render json: @group_pick, status: :created
    else
      render json: @group_pick.errors, status: :unprocessable_entity
    end
  end

  def update
    if @group_pick.update(group_pick_params)
      render json: @group_pick
    else
      render json: @group_pick.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @group_pick.destroy
    head :no_content
  end

  private

  def set_group_pick
    @group_pick = GroupPick.find(params[:id])
  end

  def group_pick_params
    params.require(:group_pick).permit(:user_id, :group_id, :group_standings)
  end
end