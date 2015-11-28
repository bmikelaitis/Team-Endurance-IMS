class VendorsController < ApplicationController 
	before_action :require_user
	before_action :require_active_user
	before_action :require_admin_user, only: [:index, :edit, :update, :show]

	def index
		@vendors = Vendor.paginate(page: params[:page], per_page: 10)
	end
	
	def show
		@vendor = Vendor.find(params[:id])
		@receipts = @vendor.receipts

	end

	def new
		@vendor = Vendor.new
	end
	def edit
		@vendor = Vendor.find(params[:id])
	end
	
	def update
		@vendor = Vendor.find(params[:id])
		if @vendor.update(vendor_params)
			flash[:success] = "The Vendor has been updated succesfully"
			redirect_to vendors_path
		else
			render 'edit'
		end
	end

	def create
		@vendor = Vendor.new(vendor_params)

		if @vendor.save
			flash[:success] = "Vendor created succesfully."
			redirect_to vendors_path
		else
			render 'new'
		end

	end

	private
	def vendor_params
		params.require(:vendor).permit(:vendor_name, :description)
	end

end