class BoughtController < ApplicationController
	def create
		bought = Bought.create(user_id:session[:user_id], shoe_id:params[:id])
		
		redirect_to '/dashboard/%d' % session[:user_id]
	end
end
