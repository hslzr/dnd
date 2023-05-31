class CreationController < ApplicationController
  before_action :find_races

  def sheet
    @races = Race.all
    @subraces = @race&.subraces || []
  end
  
  private

    def find_races
      @race = Race.find_by(id: params[:race].presence)
      @subrace = Subrace.find_by(id: params[:subrace].presence)
    end
end
