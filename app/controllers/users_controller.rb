class UsersController < ApplicationController
  before_action :require_login, except: [:new, :create]
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.all
  end

  def show
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.role = 'student'
    @user.approved = false
    if @user.save
      redirect_to login_path, notice: "Cont creat! Așteaptă aprobarea bibliotecarului"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to @user, notice: "Utilizatorul a fost actualizat"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @user.destroy
    redirect_to users_path, notice: "Utilizatorul a fost șters"
  end

  def approve
    @user = User.find(params[:id])
    @user.update(approved: true)
    redirect_to users_path, notice: "Utilizatorul a fost aprobat"
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :role, :approved)
  end
end