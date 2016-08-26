class CategoriesController < ApplicationController
	
	layout :layout?, only: [:index,:new,:destroy,:show,:create]

	def index
		@categories= Category.all
	@notes=Note.all
		@category= Category.new
	end
	
	def new
		@category= Category.new
	end
	def create
		@category= Category.new(category_params)
		 @category.save
			redirect_to categories_path
	end
	def show
		@category= Category.find(params[:id])
	end
	def edit
		@category= Category.find(params[:id])
	end
	def update
		@category= Category.find(params[:id])
		if @category.update(category_params)
			redirect_to categories_path
		else
			render 'edit'
		end
	end
	def destroy
		@category= Category.find(params[:id])
		@category.destroy
		redirect_to categories_path
	end
	private
	def category_params
		params.require(:category).permit!
	end
end
