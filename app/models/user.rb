class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: [:facebook, :google_oauth2]
  
  has_many :items
  has_one :card
  has_many :sns_credentials

  #  registrationの登録画面（STEP1）
  validates :nickname,                presence: true, length: {maximum: 20}, on: :validates_step1
  validates :last_name,               presence: true, on: :validates_step1
  validates :first_name,              presence: true, on: :validates_step1
  validates :last_name_kana,          presence: true, on: :validates_step1
  validates :first_name_kana,         presence: true, on: :validates_step1
  validates :birth_dd,                presence: true, on: :validates_step1
  validates :birth_mm,                presence: true, on: :validates_step1
  validates :birth_yy,                presence: true, on: :validates_step1

  # mount_uploader :profile_photo, ImageUploader

  #  sms_confirmationの登録画面（STEP2）
  validates :phone_number,            presence: true, uniqueness: true, numericality: true, length: {maximum: 11}, on: :validates_step2


  has_one :address
  accepts_nested_attributes_for :address

  def self.from_omniauth(auth)
    sns = SnsCredential.where(provider: auth.provider, uid: auth.uid).first_or_create
    # sns認証したことがあればアソシエーションで取得
    # 無ければemailでユーザー検索して取得orビルド(保存はしない)
    user = sns.user || User.where(email: auth.info.email).first_or_initialize(
      nickname: auth.info.name,
        email: auth.info.email
    )
    # userが登録済みの場合はそのままログインの処理へ行くので、ここでsnsのuser_idを更新しておく
    if user.persisted?
      sns.user = user
      sns.save
    end
    { user: user, sns: sns }
  end
  
end
