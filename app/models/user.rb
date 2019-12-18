class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :books, dependent: :destroy

  validates :name, length: { in: 2..20 }
  validates :introduction, length: { in: 0..50 },allow_nil: true

  attachment :profile_image

  #deviseでemailを不必要にする
  def email_required?
  	false
  end
  def email_changed?
	false
  end

end
