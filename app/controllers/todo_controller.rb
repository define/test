class TodoController < ApplicationController
	respond_to :json

	def index
		# sleep 5
		@todo = Todo.all
    render json: @todo
	end
	
	def show
		# sleep 5
		@member = Todo.find params[:id]
    render json: @member
#		sleep 1
	end
	
	def update
		# sleep 2
		@member = Todo.find params[:id]
		if @member.update_attributes params
			# render "todo/show"
      render json: @member
		else
			respond_with @member
		end
	end
	
	def create
		sleep 2
		@member = Todo.new
		if @member.update_attributes params
			# render "todo/show"
      render json: @member
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