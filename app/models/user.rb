class User < ActiveRecord::Base

# Connects this user object to Blacklights Bookmarks. 
  include Blacklight::User
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, 
         :recoverable, :rememberable, :trackable, :validatable

  validates_presence_of :first_name, message: "can't be blank"
  validates_presence_of :last_name, message: "can't be blank"
  validates_presence_of :phone, message: "can't be blank"
  validates :phone, length: { is: 10, wrong_length: "must be %{count} digits" }

  def full_name
    "#{first_name} #{last_name}"
  end
end
