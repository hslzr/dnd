class LabelsController < ApplicationController
  def index
    @armor = Armor.all.map{|item| item.name}
    @weapons = Weapon.all.map{|item| item.name}
    @tools = Tool.all.map{|item| item.name}
    @equipment = Equipment.all.map{|item| item.name}
    @gearpacks = Gearpack.all.map{|item| item.name}

    @names = {:weapons => @weapons, :armor => @armor, :tools => @tools, :equipment => @equipment, :gearpacks => @gearpacks }

    respond_to do |format|
      format.json { render json: @names}
    end
  end

  def weapons
    @names = Weapon.all
    respond_to do |format|
      format.json { render json: @names }
    end
  end

  def armor
    @names = Armor.all
    respond_to do |format|
      format.json { render json: @names }
    end
  end

  def subs
    @race = Race.find_by(name: params[:name])
    @count = @race.subraces.count

    respond_to do |format|
      format.json { render json: @count }
    end
  end

  def anyspell
    @spells = Spell.all
    respond_to do |format|
      format.json { render json: @spells}
    end
  end
end
