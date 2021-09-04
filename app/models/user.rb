class User < ApplicationRecord
  has_many :created_events, class_name: "Event", foreign_key: "owner_id"
  has_many :participations
  has_many :posts, dependent: :destroy, foreign_key: "user_id"
  has_many :messages, dependent: :destroy, foreign_key: "user_id"
  
  
  devise :database_authenticatable, :registerable,
         :rememberable, :validatable
         
  enum role: {
    teacher: 0,
    student: 1,
  }
  
  def email_required?
    false
  end

end
