class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  audited except: :encrypted_password
  has_many :apertura_cajas
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
