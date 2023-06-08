class CreationController < ApplicationController
  before_action :find_mains

  def sheet
    @races = Race.all
    @player_classes = PlayerClass.all
    @backgrounds = Background.all

    @subraces = @race&.subraces || []
    @subclasses = @player_class&.subclasses || []
    @traits = @background&.traits || []
    @bonds = @background&.bonds || []
    @ideals = @background&.ideals || []
    @flaws = @background&.flaws || []
  end

  private

    def find_mains
      @race = Race.find_by(id: params[:race].presence)
      @subrace = Subrace.find_by(id: params[:subrace].presence)
      @player_class = PlayerClass.find_by(id: params[:player_class].presence)
      @subclass = Subclass.find_by(id: params[:subclass].presence)
      @background = Background.find_by(id: params[:background].presence)
    end
end
