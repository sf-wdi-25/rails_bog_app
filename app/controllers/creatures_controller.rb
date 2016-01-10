class CreaturesController < ApplicationController
	# Displays all creatures
	def index
		# Fetches all creatures from the database and save to the instance variable, @creatures
		@creatures = Creature.all

		# Renders the index view (gives it access to the instance variable)
		render :index
	end

	def new
		render :new
	end
end
