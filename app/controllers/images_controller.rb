class ImagesController < ApplicationController
  def index
    @images = Image.all
    @image = Image.new
  end


  def create
    @image = Image.new(image_params)

      if @image.save
      render json: { message: "success", fileID: @image.id }, :status => 200
      else
      render json: { error: @image.errors.full_messages.join(',')}, :status => 400
      end 
    
  end
    def show
      @image = Image.find(params[:id])
    end
    
  def destroy
		Image.find(params[:id]).destroy
		flash[:success] = "Image Deleted"
		redirect_to receipts_path
  end

private
  def image_params
    params.require(:image).permit(:file).merge( :receipt_id => params[:receipt_id])
  end
end