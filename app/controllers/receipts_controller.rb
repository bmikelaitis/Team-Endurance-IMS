class ReceiptsController < ApplicationController
	before_action :require_user
	before_action :require_active_user
	before_action :require_admin_user, only: [:edit]
    
    def index
        @receipts = Receipt.paginate(page: params[:page], per_page: 15).order("date DESC")
    end

    
    def show
    @receipt = Receipt.find(params[:id])
    @images = @receipt.images
    @image = Image.new

    
    end

    
    def new
    @receipt = Receipt.new
    end
    
    def create

		@receipt = Receipt.new(receipt_params)
		@receipt.user = current_user

		if @receipt.save
			flash[:success] = "Your receipt was submitted successfully!"
			redirect_to receipts_path

		else
			render :new
		end
    end
    
    def edit
        @receipt = Receipt.find(params[:id])
    end
    
    def update
        @receipt = Receipt.find(params[:id]) 

		if @receipt.update(receipt_params)
			flash[:success] = "Your receipt was updated successfully!"
			redirect_to receipts_path(@receipt)
        else
			render :edit
		end
    end
	
	private
	    def receipt_params
	    	params.require(:receipt).permit(:date, :tax_amount, :purchase_amount, :purchase_method,  :descript, :subject_id, :purchaser_id, :puroption_id, :vendor_id, :department_id, user_ids: [])
	    end

end