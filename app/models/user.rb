# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string
#  last_sign_in_ip        :string
#  confirmation_token     :string
#  confirmed_at           :datetime
#  confirmation_sent_at   :datetime
#  unconfirmed_email      :string
#  failed_attempts        :integer          default(0), not null
#  unlock_token           :string
#  locked_at              :datetime
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  country                :string
#  birthdate              :date
#  admin                  :boolean          default(FALSE)
#  name                   :string
#  provider               :string
#  uid                    :string
#  avatar                 :string
#

class User < ApplicationRecord
  mount_uploader :avatar, AvatarUploader
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable, :lockable, :timeoutable, :omniauthable

  has_many :enrolls
  has_many :courses, through: :enrolls
  has_many :posts
  has_many :comments

  # User Avatar Validation
  validates_integrity_of :avatar
  validates_processing_of :avatar
  validates :password, length: {minimum: 5, maximum: 120}, on: :update, allow_blank: true


  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.name = auth.info.name
      user.skip_confirmation!
      # If you are using confirmable and the provider(s) you use validate emails,
      # uncomment the line below to skip the confirmation emails.
      # user.skip_confirmation!
      if auth.provider == "google_oauth2"
        user.birthdate = auth.extra.raw_info.birthday
      else
        if auth.extra.raw_info.birthday == nil
        else
          user.birthdate = Date.strptime(auth.extra.raw_info.birthday,'%m/%d/%Y')
        end
      end
      user.save!
    end
  end

end
