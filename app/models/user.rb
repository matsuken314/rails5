class User < ApplicationRecord
  # ***** 以下を追加 *****
  has_many :foods, dependent: :destroy
  # ***** 以上を追加 *****
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :rememberable, :validatable
end
