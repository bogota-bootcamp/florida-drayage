class User < ApplicationRecord


	
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  after_create :assign_default_role
  rolify


  def assign_default_role
    self.add_role(:newuser) if self.roles.blank?
  end
end
