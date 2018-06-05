class ImagesController < ApplicationController
	def index
		@images = Image.where(user_id: params[:user_id])
	end

	def new
		@user = current_user
		@image = Image.new
	end

	def create
		@user = current_user
		@image = Image.new(image_params)
		@image.user_id = current_user.id
		if @image.save
			flash[:success] = "Изображение загружено!"
	      	redirect_to @user
	    else
	      	flash.now[:error] = "Ошибка загрузки!"
	      	redirect_to @user
	    end
	end	

	private
	def image_params
		params.require(:image).permit(:image, :description, :user_id)
	end
end
