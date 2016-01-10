class CreaturesController < ApplicationController
  before_action :get_id, only: [:show, :edit, :update, :destroy]
  before_action :get_params, only: [:create, :update]


  def index
    @creatures = Creature.all
    render :index
  end

  def new
    @creature = Creature.new
    render :new
  end

  def create
    creature = Creature.new(@creature_params)
    if creature.save
      redirect_to creatures_path(creature)
    end
  end

  def show
    @creature = Creature.find_by_id(@creature_id)
    render :show
  end

  def edit
    @creature = Creature.find_by_id(@creature_id)
    render :edit
  end

  def update
    creature = Creature.find_by_id(@creature_id)
    creature.update_attributes(@creature_params)
    redirect_to creatures_path(creature)
  end

  def destroy
    creature = Creature.find_by_id(@creature_id)
    creature.destroy
    redirect_to creatures_path
  end

  private

  def get_id
    @creature_id = params[:id]
  end

  def get_params
    @creature_params = params.require(:creature).permit(:name, :description)
  end

end
