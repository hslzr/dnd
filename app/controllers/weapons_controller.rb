class WeaponsController < ApplicationController
  before_action :set_weapon, only: [ :show ]

  def index
    @weapons = Subclass.all

    respond_to do |format|
      format.json { render json: @weapons}
    end
  end

  def show
    respond_to do |format|
      format.json { render json: @weapon }
    end
  end

  private
  def set_weapon
    @weapon = Weapon.where(wep_type: params[:wep_type])
  end
end