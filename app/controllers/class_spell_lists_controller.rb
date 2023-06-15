class ClassSpellListsController < ApplicationController
  before_action :set_class_spell_list, only: [ :show ]

  def index
    @class_spell_lists = ClassSpellList.all

    respond_to do |format|
      format.json { render json: @class_spell_lists }
    end
  end

  def show
    respond_to do |format|
      format.json { render json: @class_spell_list }
    end
  end

  private
  def set_class_spell_list
    @class_spell_list = ClassSpellList.find_by(name: params[:name]).spells
  end
end