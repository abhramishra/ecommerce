class ReviewsController < ApplicationController
	before_action :authenticate_user!,except:[:create]
	load_and_authorize_resource
	def create
		@review = Review.new(review_params)
		if @review.save
			redirect_to product_path(@review.product_id), notice: "Review added"
		else
			redirect_to product_path(@review.product_id), notice: "saved"
		end
	end

	def destroy
		@review = Review.find(params[:id])
		@review.destroy
		redirect_to product_path(@review.product_id)
	end

	private

	def review_params
		params[:review].permit(:body,:rating,:product_id)
	end
end
