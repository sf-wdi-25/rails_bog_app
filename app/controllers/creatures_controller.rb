class CreaturesController < ApplicationController

	def index
		@creatures = Creature.all
		render :index
	end

	def new
		@creature = Creature.new
		render :new
	end

	def create
		creature_params = params.require(:creature).permit(:name, :description)
		creature = Creature.new(creature_params)
    if creature.save
			redirect_to creatures_path(creature)
		end
	end

	def show
    # get the creature id from the url params
    creature_id = params[:id]

    # use `creature_id` to find the creature in the database
    # and save it to an instance variable
    @creature = Creature.find_by_id(creature_id)

    # render the show view (it has access to instance variable)
    render :show
  end

  def edit
  	creature_id = params[:id]
  	@creature = Creature.find_by_id(creature_id)
  	render :edit
  end

	def update
    creature_id = params[:id]
    @creature = Creature.find_by_id(creature_id)
    creature_params = params.require(:creature).permit(:name, :description)
    @creature.update_attributes(creature_params)
    redirect_to creature_path(@creature)
	end

	def destroy
		creature_id = params[:id]
		@creature = Creature.find(creature_id)
		@creature.destroy
		redirect_to creatures_path
	end

end
