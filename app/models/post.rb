class Post < ApplicationRecord
  validates :title, :start_date, :end_date, presence: true
  
  validates :title, length: { maximum: 20 }
  
  validates :memo, length: { maximum: 500 }, allow_blank: true

  validate :end_date_after_start_date

  private

  def end_date_after_start_date
    return if end_date.blank? || start_date.blank?

    errors.add(:end_date, "は開始日より後である必要があります") if end_date < start_date
  end
end