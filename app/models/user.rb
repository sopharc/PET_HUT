class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :customer
  # validates :first_name, presence: true
  # validates :last_name, presence: true
  validates :email, presence: true

  # for Active Admin
  def name
    "#{id} - #{email}"
  end

end
