class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
        :jwt_authenticatable, jwt_revocation_strategy: JwtDenylist

  has_many :user_dishes
  has_many :market_dishes, through: :user_dishes
  has_many :trocs, foreign_key: "caller_id", class_name: "Troc"
  has_many :trocs, foreign_key: "answerer_id", class_name: "Troc"
  has_many :donations, foreign_key: "caller_id", class_name: "Donation"
  has_many :donations, foreign_key: "answerer_id", class_name: "Donation"
end
