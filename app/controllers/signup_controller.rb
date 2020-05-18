class SignupController < ApplicationController

  def index
  end

  def registration
    @user = User.new
  end

  def sms_confirmation

    session[:nickname] = user_params[:nickname]
    session[:email] = user_params[:email]
    session[:password] = user_params[:password]
    session[:encrypted_password] = user_params[:encrypted_password]
    session[:birth_yy] = user_params[:birth_yy]
    session[:birth_mm] = user_params[:birth_mm]
    session[:birth_dd] = user_params[:birth_dd]    
    session[:family_name] = user_params[:family_name] 
    session[:first_name] = user_params[:first_name]
    session[:family_name_kana] = user_params[:family_name_kana]
    session[:first_name_kana] = user_params[:first_name_kana]
    @user = User.new
  end

  def sms_confirmation_sms
    session[:phone_number] = user_params[:phone_number]
    @user = User.new
  end

  def address

    @user = User.new
    @user.build_address

  end

  def create
    @user = User.new(
      nickname: session[:nickname], 
      email: session[:email],
      password: session[:encrypted_password],
      birth_yy: session[:birth_yy],
      birth_mm: session[:birth_mm],
      birth_dd: session[:birth_dd],
      family_name: session[:family_name], 
      first_name: session[:first_name], 
      family_name_kana: session[:family_name_kana], 
      first_name_kana: session[:first_name_kana], 
      phone_number: session[:phone_number],
    )
    @user.save

    @address = @user.build_address(
      first_name: user_params[:address_attributes][:first_name],
      last_name:  user_params[:address_attributes][:last_name],
      first_name_kana:  user_params[:address_attributes][:first_name],
      last_name_kana:  user_params[:address_attributes][:last_name],
      phone_number:  user_params[:address_attributes][:phone_number],
      post_number:  user_params[:address_attributes][:post_number],
      prefecture_id:  user_params[:address_attributes][:prefecture_id],
      city:  user_params[:address_attributes][:city],
      address_number:  user_params[:address_attributes][:address_number],
      building:  user_params[:address_attributes][:building],
    )
    @address.save

    redirect_to root_path
  end 


  private
  def user_params
    params.require(:user).permit(
      :nickname,
      :email,
      :password,
      :encrypted_password,
      :birth_yy,
      :birth_mm,
      :birth_dd,
      :first_name,
      :family_name,
      :first_name_kana,
      :family_name_kana,
      :phone_number,

      address_attributes:[
      :first_name,
      :last_name,
      :first_name_kana,
      :last_name_kana,
      :post_number,
      :prefecture_id,
      :city,
      :address_number,
      :building,
      :phone_number])
  end

end
