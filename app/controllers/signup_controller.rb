class SignupController < ApplicationController

  before_action :registration_valid, only: :sms_confirmation
  before_action :sms_confiirmation_valid, only: :address
  before_action :address_valid, only: :create

  def index
    redirect_to root_path if user_signed_in?
  end

  def registration
    @user = User.new

  end


  def registration_valid #バリデーション
    if params[:sns_auth] == 'true'
      pass = Devise.friendly_token
      params[:user][:password] = pass
      params[:user][:password_confirmation] = pass
    end
    session[:nickname] = user_params[:nickname]
    session[:email] = user_params[:email]
    session[:password] = user_params[:password]
    session[:birth_yy] = user_params[:birth_yy]
    session[:birth_mm] = user_params[:birth_mm]
    session[:birth_dd] = user_params[:birth_dd]    
    session[:last_name] = user_params[:last_name] 
    session[:first_name] = user_params[:first_name]
    session[:last_name_kana] = user_params[:last_name_kana]
    session[:first_name_kana] = user_params[:first_name_kana]

    @user = User.new(
    nickname: session[:nickname],
    email: session[:email],
    password: session[:password],
    birth_yy: session[:birth_yy],
    birth_mm: session[:birth_mm],
    birth_dd: session[:birth_dd],
    last_name: session[:last_name],
    first_name: session[:first_name],
    last_name_kana: session[:last_name_kana],
    first_name_kana: session[:first_name_kana],
    )

    render registration_signup_index_path unless @user.valid?(:validates_step1)
  end

  def sms_confirmation
    @user = User.new
  end

  def sms_confiirmation_valid #バリデーション

    session[:phone_number] = user_params[:phone_number]

    @user = User.new(
      nickname: session[:nickname], 
      email: session[:email],
      password: session[:password],
      birth_yy: session[:birth_yy],
      birth_mm: session[:birth_mm],
      birth_dd: session[:birth_dd],
      last_name: session[:last_name], 
      first_name: session[:first_name], 
      last_name_kana: session[:last_name_kana], 
      first_name_kana: session[:first_name_kana], 
      phone_number: session[:phone_number]
      )

    render sms_confirmation_signup_index_path unless @user.valid?(:validates_step2)
  end

  def address
    @user = User.new
    @user.build_address
  end

  def address_valid
    @user = User.new(
      nickname: session[:nickname], 
      email: session[:email],
      password: session[:password],
      birth_yy: session[:birth_yy],
      birth_mm: session[:birth_mm],
      birth_dd: session[:birth_dd],
      last_name: session[:last_name], 
      first_name: session[:first_name], 
      last_name_kana: session[:last_name_kana], 
      first_name_kana: session[:first_name_kana], 
      phone_number: session[:phone_number],
    )

    @user.address_attributes = user_params[:address_attributes]
    render address_signup_index_path unless @user.valid?(:validates_step3)
  end

  def create

    @user = User.new(
      nickname: session[:nickname], 
      email: session[:email],
      password: session[:password],
      birth_yy: session[:birth_yy],
      birth_mm: session[:birth_mm],
      birth_dd: session[:birth_dd],
      last_name: session[:last_name], 
      first_name: session[:first_name], 
      last_name_kana: session[:last_name_kana], 
      first_name_kana: session[:first_name_kana], 
      phone_number: session[:phone_number],
    )
    if @user.save
      session[:id] = @user.id
      @address = @user.build_address(

        first_name: user_params[:address_attributes][:first_name],
        last_name:  user_params[:address_attributes][:last_name],
        first_name_kana:  user_params[:address_attributes][:first_name],
        last_name_kana:  user_params[:address_attributes][:last_name],
        phone_number:  user_params[:address_attributes][:phone_number],
        post_number:  user_params[:address_attributes][:post_number],
        area_id:  user_params[:address_attributes][:area_id],
        city:  user_params[:address_attributes][:city],
        address_number:  user_params[:address_attributes][:address_number],
        building:  user_params[:address_attributes][:building],
      )
      @address.save
      sign_in User.find(session[:id]) unless user_signed_in?
      redirect_to root_path
    else
      redirect_to signup_index_path
    end
  end 


  private
  def user_params
    params.require(:user).permit(
      :nickname,
      :email,
      :password,
      :birth_yy,
      :birth_mm,
      :birth_dd,
      :first_name,
      :last_name,
      :first_name_kana,
      :last_name_kana,
      :phone_number,

      address_attributes:[
      :first_name,
      :last_name,
      :first_name_kana,
      :last_name_kana,
      :post_number,
      :area_id,
      :city,
      :address_number,
      :building,
      :phone_number])
  end
end