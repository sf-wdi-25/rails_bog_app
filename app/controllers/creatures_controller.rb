class CreaturesController < ApplicationController
  #display all creatures
  def index
    #get all creatures from db and save to instance variable
    @creatures = Creature.all

    #render the index view (it has access to instance variable)
    render :index
  end

  #show the new creature form
  def new
    @creature = Creature.new
    render :new
  end

  #create a new creature in the database
  def create
    creature_params = params.require(:creature).permit(:name, :description)

    creature = Creature.new(creature_params)

    if creature.save
      redirect_to creature_path(creature)
    end

  end

  #display a specific creature
  def show
    creature_id = params[:id]
    @creature = Creature.find_by_id(creature_id)
    render :show
  end

  def edit
    creature_id = params[:id]
    @creature = Creature.find_by_id(creature_id)
    render :edit
  end

end