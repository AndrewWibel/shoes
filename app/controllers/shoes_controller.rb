class ShoesController < ApplicationController
	def show
		@user = User.find(session[:user_id])
		@shoes = Shoe.all
	end

	def new
		shoe = Shoe.create(product:params[:product], user_id:session[:user_id], ammount:params[:amount])
		redirect_to '/dashboard/%d' % session[:user_id]
	end

	def destroy
		shoe = Shoe.find(params[:id])
		shoe.destroy
		redirect_to '/dashboard/%d' % session[:user_id]
	end
end
