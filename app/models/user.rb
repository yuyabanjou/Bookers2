class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, length: { in: 2..20 }

  #deviseでemailを不必要にする
  def email_required?
  	false
  end
  def email_changed?
	false
  end

   def new
   end
   def create
   end
   def index
   end
   def show
   end

end
