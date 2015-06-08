class CreaturesController < ApplicationController
	
	# render all creatures at index
	def index
		@creatures = Creature.all
		render :index
	end

	# render new when creatures/new is hit for a new method
	def new
		@creature = Creature.new
		render :new
	end

	# method for creating a creature
	def create
		new_creature = params.require(:creature).permit(:name, :description)
		creature = Creature.create(new_creature)
		redirect_to "/creatures/#{creature.id}"
	end

	def show
		id = params[:id]
		@creature = Creature.find(id)
		render :show
	end

	def edit
		id = params[:id]
		@creature = Creature.find(id)
		render :edit
	end

	def update
		creature_id = params[:id]
		creature = Creature.find(creature_id)
		updated_attributes = params.require(:creature).permit(:name, :description)
		#get updated data
		creature.update_attributes(updated_attributes)
		redirect_to "/creatures/#{creature_id}"
	end

	def delete
		id = params[:id]
		creature = Creature.find(id).destroy
		redirect_to "/creatures"

	end
end
