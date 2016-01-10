class CreaturesController < ApplicationController
	# Displays all creatures
	def index
		# Fetches all creatures from the database and save to the instance variable, @creatures
		@creatures = Creature.all

		# Renders the index view (gives it access to the instance variable)
		render :index
	end

	def new
		@creature = Creature.new
		render :new
	end

	# create a new creature in the database
  def create
    # whitelist params and save them to a variable
    creature_params = params.require(:creature).permit(:name, :description)

    # create a new creature from `creature_params`
    creature = Creature.new(creature_params)

    # if creature saves, redirect to route that displays all creatures
    if creature.save
      redirect_to creature_path(creature)
      # redirect_to creatures_path is equivalent to:
      # redirect_to "/creatures"
    end
  end

  def show
  	# Get the creature ID from the parameters
  	creature_id = params[:id]

  	# Searches the db for the instance of that id
  	@creature = Creature.find_by_id(creature_id)

  	# Makes @creature available to be displayed
  	render :show
  end

end
