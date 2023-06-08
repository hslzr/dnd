class RacesController < ApplicationController
  before_action :set_race, only: %i[ show ]

  def index
    @races = Race.all

    respond_to do |format|
      format.json {
        render json: @races
      }
    end
  end

  def show
    respond_to do |format|
      format.json { render json: @race }
    end
  end

  private
  def set_race
    @race = Race.find(params[:id])
  end
end
