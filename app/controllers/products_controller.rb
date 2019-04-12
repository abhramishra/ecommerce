class ProductsController < ApplicationController
	
	# path - products_path
	# url - localhost:3000/products
	# uri - /products
	# http method - GET
	# roles & resposnsibility - to list all products
	def index
		@products = Product.all
	end

	# path - new_product_path
	# url - localhost:3000/products/new
	# uri - /products/new
	# http method - GET
	# roles & resposnsibility - is to setup a form for adding a new product
	def new
		@product = Product.new
	end

	# path - products_path
	# url - localhost:3000/products
	# uri - /products
	# http method - POST
	# roles & resposnsibility - take the data comming in from the form, pass it to the constructor as an argument, validate the object, if the validation pass insert the record to the db then redirect the user to a new page, else display the errors on the form
	def create
		@product = Product.new(product_params)
		if @product.save
			redirect_to product_path(@product.id), notice: "The product has successfully created"
		else
			render action: 'new'
			
		end
	end

	# path - product_path(id)
	# url - htttp://localhost:3000/products/:id
	# uri - /products/:id
	# http method - GET
	# roles & resposnsibility - to find the product from the database and display it on the show page, this page will be used to show all the data about a product and also associated information like all reviews, all q&a's, add product to cart
	def show
		@product = Product.find(params[:id]) 
	end

	# path - edit_product_path(id)
	# url - htttp://localhost:3000/products/:id/edit
	# uri - /products/:id/edit
	# http method - GET
	# roles & resposnsibility - to find the record the user is trying to edit, and display it on a form
	def edit
		@product = Product.find(params[:id])
	end

	# path - product_path(id)
	# url - htttp://localhost:3000/products/:id
	# uri - /products/:id
	# http method - PATCH
	# roles & resposnsibility - find the record, the user just updated the browser, and update its information by taking the data comming in from the form, validate the object, if the validation pass update the record to the db and redirect the user to the show page, else display the errors on the form
	def update
		@product = Product.find(params[:id])
		if @product.update_attributes(product_params)
			redirect_to product_path(@product.id), notice: "The product has successfully updated"			
		else
			render action: 'edit'
		end
	end

	# path - product_path(id)
	# url - htttp://localhost:3000/products/:id
	# uri - /products/:id
	# http method - DELETE
	# roles & resposnsibility - find the record, the user is trying to delete, and destroy the record and redirect the user to a index page 
	def destroy
		@product = Product.find(params[:id])
		@product.destroy
		redirect_to products_path, notice: "The product has deleted successfully"
	end

	#private method is a method that can be access within the class but not accssable from outside the class
	private

	def product_params
		params[:product].permit(:name,:price,:description,:stock,:category_id, :cod_eligible, :image_url)
	end
end

