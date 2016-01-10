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

	def create 
		#whitelist params and save them to a variable
		creature_params = params.require(:creature).permit(:name, :description)

		#create a new creature from 'creature_prams'
		creature = Creature.new(creature_params)

		#if creature saves, redirect to route that displays all creatures
		if creature.save
			redirect_to creature_path(creature)
			#redirect_to creatures_path is equivalent to:
			#redirect_to "/creatures#{creature.id}"
		end
	end

	def show
		#get the creature id from the url params
		creature_id = params[:id]

		#use 'creature_id' to find hte creature in the database
		#save it to an instance variable
		@creature = Creature.find_by_id(creature_id)

		#render the show view(it has access to instance variable)
		render :show

	end

	def edit
		#get the creature id from teh url params
		creature_id = params[:id]

		#use 'creature_id' to find the creature in the database
		#and save it to an instance variable
		@creature = Creature.find_by_id(creature_id)

		#render the edit view (it has access to the instance variable)
		render :edit
	end

	#update the creature in the database
	def update 
		#get the creature id from the url params
		creature_id = params[:id]

		#use 'creature_id' to find the creature in the database
		#and save it to an instance variable
		creature = Creature.find_by_id(creature_id)

		# whitelist params and save them to a variable
		creature_params = params.require(:creature).permit(:name, :description)

		creature.update_attributes(creature_params)

		#redirect to show page for the updated creture
		redirect_to creature_path(creature)
		#redirect_to creature_path(creature) is equivalent to:
		#redirect_to "/creatures/#{creature.id}"
	end

	def destroy
		#get the creature id from the url params
		creature_id = params[:id]

		#use 'creature_id' to find the creature in database
		#and save it to an instance variable
		creature = Creature.find_by_id(creature_id)

		#destroy the creature
		creature.destroy

		#redirect to creatures index
		redirect_to creatures_path
		#redirect to creatures_path is equivalent to:
		#redirect_to "/creatures"
	end
end
