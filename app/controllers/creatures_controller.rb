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
		render :new
	end

end
