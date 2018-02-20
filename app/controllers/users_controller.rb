class UsersController < ApplicationController
  before_action :authenticate_user, {only: [:logout]}
  before_action :set_default_user_images
  before_action :ensure_correct_user, {only: [:setting_profile, :setting_account]}
  before_action :forbid_login_user, {only: [:login, :login_form, :create, :sign_up]}
  
  def ensure_correct_user
    if @current_user.id != params[:id].to_i
      redirect_to("/")
    end
  end
  
  def sign_up
  end

  def login_form
  end
  
  def create
    @user = User.new(name: params[:name], email: params[:email], password: params[:password], image_name: "default_user.jpg")
    @user.save
    session[:user_id] = @user.id
    redirect_to("/")
  end
  
  def login
    @user = User.find_by(email: params[:email], password: params[:password])
    if @user
      session[:user_id] = @user.id
      redirect_to("/")
    else
      @email = params[:email]
      @password = params[:password]
      if User.find_by(email: params[:email])
        @error_message = "パスワードが間違っています"
      else
        @error_message = "メールアドレスが間違っています"
      end
      render("users/login_form")
    end
  end
  
  def logout
    session[:user_id] = nil
    redirect_to("/users/login_form")
  end
  
  def setting_profile
    @user = User.find_by(id: params[:id])
  end
  
  def setting_account
    @user = User.find_by(id: params[:id])
  end
  
  def update_profile
    @user = User.find_by(id: params[:id])
    @user.name = params[:name]
    @user.profile = params[:profile]
    if @user.save
      redirect_to("/")
    else
      render("users/setting_profile")
    end
  end
  
  def update_account
    @user = User.find_by(id: params[:id])
    @user.email = params[:email]
    if @user.save
      redirect_to("/")
    else
      render("users/setting_account")
    end
  end
  
end
