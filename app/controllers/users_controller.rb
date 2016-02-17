class UsersController < ApplicationController

	def create
		@user_new = User.new(new_user_params)
		if @user_new.valid?
			@user_new.save
			session[:user_id] = @user_new.id
			redirect_to '/'
		else
			flash[:messages] = @user_new.errors.full_messages
			redirect_to '/'
		end
	end

	def show
		@user = User.find(session[:user_id])
		@bought = @user.bought.all
		if not @total
			@total = 0
		else
			@total += @bought.shoe.ammount
		end
	end

	private

	def new_user_params
		params.require(:user).permit(:first_name, :last_name, :email, :password)
	end
end