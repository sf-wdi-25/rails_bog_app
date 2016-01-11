#the path we are in is app/controllers/creatures_controller.rb

class CreaturesController < ApplicationController
	
	def index
		#gets all creatures from the database and saves it in a variable
		@creatures = Creature.all

		#this renders the index view
		render :index
	end

	#shows new creature form
	def new
		@creature = Creature.new
		render :new
	end

	def create
		# whitelist params and save them to a variable
		creature_params = params.require(:creature).permit(:name, :description)

		# create a new creature from `creature_params`
		creature = Creature.new(creature_params)

		# if creature saves, redirect to route that displays
		# ONLY the newly created creature
		if creature.save
		  redirect_to creature_path(creature)
		  # redirect_to "/creatures/#{creature.id}"
		end
	end

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

	def update

		#getting the id of the creature
		creature_id = params[:id]

		# creature equals the id requested
		creature = Creature.find_by_id(creature_id)

		#white listing the params and saving them into a variable
		creature_params = params.require(:creature).permit(:name, :description)

		#updaing the creature attributes within the params
		creature.update_attributes(creature_params)

		#redirecting the show the page of to the updated creature
		redirect_to creature_path(creature)
	end

	def destroy
		creature_id = params[:id]

		#getting creature by id from the url params
		creature = Creature.find_by_id(creature_id)

		#using the creature id to find the creature within the database
		creature = Creature.find_by_id(creature_id)

		#destroying the creature by id
		creature.destroy

		#redirecting to the creatures index page
		redirect_to creatures_path

	end

end
