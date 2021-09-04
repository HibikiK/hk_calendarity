class Event < ApplicationRecord
  belongs_to :owner, class_name: 'User'
  has_many :participations, dependent: :destroy
  has_one_attached :image, dependent: false

  validates :name, length: { maximum: 50 }, presence: true
  validates :place, length: { maximum: 50 }, presence: true
  validates :definition, length: { maximum: 300  }, presence: true
  validates :audience, length: { maximum: 50 }, presence: true
  validates :start_at, presence: true
  validates :end_at, presence: true
  # validates :event_type, numericality: { greater_than_or_equal_to: 0 , message: 'を選択してください' }
  validate :start_at_should_be_before_end_at
  validates :image, 
    content_type: [:png, :jpg, :jpeg], 
    size: { less_than_or_equal_to: 10.megabytes },
    dimension: {width: {max: 2000} , height: { max: 2000}}

  enum event_type: {
    conference: 0,
    meeting: 1,
    gigtalk: 2,
    party: 3,
    lecture: 4,
    presentation: 5,
    competition: 6,
    trip: 7,
    else: 8
  }

  attr_accessor :remove_image

  before_save :remove_image_if_user_accept

  def created_by?(user)
    return false unless user
      owner_id == user.id
  end

  private

  def remove_image_if_user_accept
    self.image = nil if ActiveRecord::Type::Boolean.new.cast(remove_image)
  end

  def start_at_should_be_before_end_at
    return unless start_at && end_at

    if start_at >= end_at
      errors.add(:start_at, "は終了時間よりも前に設定してください")
    end
  end

end
