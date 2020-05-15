class SignupController < ApplicationController

  def  step1
  end

  def step2
    @user = User.new
  end

  def step3
    session[:nickname] = user_params[:nickname]
    session[:email] = user_params[:email]
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

  def step4
    session[:phone_number] = user_params[:phone_number]
    @user = User.new
  end

  def step5

    @user = User.new
    @user.build_address


  end

  def step6
    @user = User.new(user_params)
      # nickname: session[:nickname],
      # email: session[:email],
      # password: session[:password],
      # birth_yy: session[:birth_yy],
      # birth_mm: session[:birth_mm],
      # birth_dd: session[:birth_dd],
      # family_name: session[:family_name],
      # first_name: session[:first_name],
      # family_name_kana: session[:family_name_kana],
      # first_name_kana: session[:first_name_kana],
      # phone_number: session[:phone_number])

      @user.save

      redirect_to root_path
  end 


  private
  def user_params
    params.require(:user).permit(
      :nickname,
      :email,
      :password,
      :encrypted_password,
      :birth_year,
      :birth_month,
      :birth_day,
      :first_name,
      :family_name_name,
      :first_name_kana,
      :family_name_name_kana,
      :phone_number,
      address_attributes:[
      :id,
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
