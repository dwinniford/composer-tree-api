class SessionsController < ApplicationController
  def create
    @user = User.find_by(name: params[:user][:name], email: params[:user][:email])
        if @user && @user.authenticate(params[:user][:password])
            session[:user_id] = @user.id          
            render json: @user, only: [:name]
        else 
            render json: {errors: "login failed"}
        end
  end

  def destroy
    session.delete(:user_id)
    render status: :ok 
  end
end
