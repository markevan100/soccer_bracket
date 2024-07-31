class Api::V1::GroupStandingsController < ApplicationController
  def index
    render json: GroupStandingsCalculator.calculate_all
  end
end