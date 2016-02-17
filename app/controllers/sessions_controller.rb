class SessionsController < ApplicationController
  def index
  end

  def create
  	@user = User.find_by_email(params[:email])
  	if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
  		redirect_to '/dashboard/%d' % @user.id
  	else
  		flash[:messages] = @user.errors.full_messages 
  		redirect_to '/'
  	end
  end

  def destroy
  	session.clear
  	redirect_to '/'
  end
end
