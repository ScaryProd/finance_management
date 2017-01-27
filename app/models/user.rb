class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  # attr_accessor :email, :password, :password_confirmation, :remember_me, :name
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # has_many is an attribute that allows the userto have many expense models.
  has_many :expenses

end
