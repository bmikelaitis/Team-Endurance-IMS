class PuroptionsController < ApplicationController 
	before_action :require_user
	before_action :require_active_user
	before_action :require_admin_user, only: [:index, :edit, :update, :show]

	def index
		@puroptions = Puroption.paginate(page: params[:page], per_page: 3)
	end
	
	def show
		@puroption = Puroption.find(params[:id])
		@receipts = @puroption.receipts
	end

	def new
		@puroption = Puroption.new
	end
	def edit
		@puroption = Puroption.find(params[:id])
	end
	
	def update
		@puroption = Puroption.find(params[:id])
		if @puroption.update(puroption_params)
			flash[:success] = "The Purchase Option has been updated succesfully"
			redirect_to puroptions_path
		else
			render 'edit'
		end
	end

	def create
		@puroption = Puroption.new(puroption_params)

		if @puroption.save
			flash[:success] = "Purchase Option created succesfully."
			redirect_to puroptions_path
		else
			render 'new'
		end

	end

	private
	def puroption_params
		params.require(:puroption).permit(:puroption_name, :description)
	end

end