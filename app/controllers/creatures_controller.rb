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

  def edit
  	creature_id = params[:id]

  	@creature = Creature.find_by_id(creature_id)

  	render :edit
  end

  def update
    # get the creature id from the url params
    creature_id = params[:id]

    # use `creature_id` to find the creature in the database
    # and save it to an instance variable
    creature = Creature.find_by_id(creature_id)

    # whitelist params and save them to a variable
    creature_params = params.require(:creature).permit(:name, :description)

    # update the creature
    creature.update_attributes(creature_params)

    # redirect to show page for the updated creature
    redirect_to creature_path(creature)
    # redirect_to creature_path(creature) is equivalent to:
    # redirect_to "/creatures/#{creature.id}"
  end

end
