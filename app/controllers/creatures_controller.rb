class CreaturesController < ApplicationController
	# display all CreaturesController
	def index
		# get all creatures from db and save to instance variables
		@creatures = Creature.all

		# render the index view (it has access to instance variable)
		render :index
	end
	
end
