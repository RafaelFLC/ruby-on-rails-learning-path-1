class Admin::UsersController < ApplicationController
  def index
    @users = User.sorted
  end

  def show
    @user = User.find params['id']
  end

  def new
    @user = User.new
  end

  def create 
    @user = User.new user_params
    if @user.save 
      redirect_to(admin_users_path)
    else
      render('new')
    end
  end

  def edit
    @user = User.find params[:id]
    puts @user
  end

  def update 
    @user = User.find params[:id]
    if @user.update(user_params)
      redirect_to(admin_user_path @user)
    else 
      render 'edit'
    end
  end

  def delete 
    @user = User.find params[:id]
  end

  def destroy 
    @user = User.find params[:id]
    @user.destroy
    redirect_to(admin_users_path)
  end 

  private 
  def user_params 
    params.require(:user).permit(:id, :name, :lastname, :username, :role, :password, :password_confirmation)
  end
end
