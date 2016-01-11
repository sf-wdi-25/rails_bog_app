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
		#white lists params and saves them to a varaible
		creature_params = params.require(:creature).permit(:name, :description)

		#creating a new creature from the parameter of creature
		creature = Creature.new(creature_params)

		#if it saves then it refreshes the page and displays all the creatures
		if creature.save
			redirect_to creatures_path
		end
	end

end
