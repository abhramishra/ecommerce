class CategoriesController < ApplicationController
	
	# path - categories_path
	def index
		@categories = Category.all
	end

	# path - new_category_path 
	def new
		@category = Category.new
	end

	# path - categories_path
	def create
		@category = Category.new(category_params)
		if @category.save
			redirect_to categories_path
			
		else
			render action: 'new'
		end
		
	end

	# path - category_path(id) 
	def show 
		@category = Category.find(params[:id])
	end

	# path - edit_category_path(id)
	def edit
		@category = Category.find(params[:id])
	end

	# path - category_path(id)
	def update
		@category = Category.find(params[:id])
		if @category.update_attributes(category_params)
			redirect_to category_path(@category.id),notice: "Updated successfully"
		else
			render action: 'edit'
		end
	end

	#path - 
	def destroy
		@category = Category.find(params[:id])
		@category.destroy
		redirect_to categories_path, notice: "You have deleted the category successfully"
	end

	private

	def category_params
		params[:category].permit(:name)
	end
end
