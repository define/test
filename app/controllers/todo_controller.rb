class TodoController < ApplicationController
	respond_to :json
	
	def index
		# sleep 5
		@todo = Todo.all
	end
	
	def show
		# sleep 5
		@member = Todo.find params[:id]
#		sleep 1
	end
	
	def update
		sleep 2
		@member = Todo.find params[:id]
		if @member.update_attributes params
			render "todo/show"
		else
			respond_with @member
		end
	end
	
	def create
		sleep 2
		@member = Todo.new
		if @member.update_attributes params
			render "todo/show"
		else
			respond_with @member
		end
	end
	
	def destroy
		sleep 2
		member = Todo.find params[:id]
		member.destroy()
		render json: {}
	end
	
end