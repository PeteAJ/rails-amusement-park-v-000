class UsersController < ApplicationController
    before_action :set_user, only: [:show, :edit, :update]
   def show
     @message = params[:message] if params[:message]
     @message ||= false
   end

   def new
     @user = User.new
   end

   def create
     @user = User.new(user_params)
     if @user.save
       session[:user_id] = @user.id
       redirect_to user_path(@user)
     else
       redirect_to root_path
     end
   end

   def edit
   end

   def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
      else
        format.html { render :edit }
      end
     end
    end
private

   def set_user
     @user = User.find(params[:id])
   end

   def user_params
      params.require(:user).permit(
        :name,
        :password,
        :height,
        :tickets,
        :happiness,
        :nausea,
        :admin
      )
    end
end
