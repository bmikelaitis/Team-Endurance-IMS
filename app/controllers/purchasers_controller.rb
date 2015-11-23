class PurchasersController < ApplicationController 
	before_action :require_user
	before_action :require_active_user
	before_action :require_admin_user, only: [:index, :edit, :update, :show]

	def index
		@purchasers = Purchaser.paginate(page: params[:page], per_page: 3)
	end
	
	def show
		@purchaser = Purchaser.find(params[:id])
		@receipts = @purchaser.receipts
	end

	def new
		@purchaser = Purchaser.new
	end
	def edit
		@purchaser = Purchaser.find(params[:id])
	end
	def update
		@purchaser = Purchaser.find(params[:id])
		if @purchaser.update(purchaser_params)
			flash[:success] = "The Purchaser has been updated succesfully"
			redirect_to purchasers_path
		else
			render 'edit'
		end
	end
	
	def create
		@purchaser = Purchaser.new(purchaser_params)

		if @purchaser.save
			flash[:success] = "Purchaser created succesfully."
			redirect_to purchasers_path
		else
			render 'new'
		end

	end

	private
	def purchaser_params
		params.require(:purchaser).permit(:purchaser_name, :worker_category)
	end

end