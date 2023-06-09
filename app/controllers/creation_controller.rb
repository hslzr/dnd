class CreationController < ApplicationController
  before_action :find_mains #update on turbo_frame submit

  def sheet
    @races = Race.all
    @player_classes = PlayerClass.all
    @backgrounds = Background.all

    #conditional form select population
    @subraces = @race&.subraces || []
    @subclasses = @player_class&.subclasses || []
    @traits = @background&.traits || []
    @bonds = @background&.bonds || []
    @ideals = @background&.ideals || []
    @flaws = @background&.flaws || []

    @levels = [];
    for i in 1..20 do
      @levels.push([i,i])
    end

  end

  private

    def find_mains
      #conditional form select population
      @race = Race.find_by(id: params[:race].presence)
      @subrace = Subrace.find_by(id: params[:subrace].presence)
      @player_class = PlayerClass.find_by(id: params[:player_class].presence)
      @subclass = Subclass.find_by(id: params[:subclass].presence)
      @background = Background.find_by(id: params[:background].presence)
      @level = params[:level]
    end
end
