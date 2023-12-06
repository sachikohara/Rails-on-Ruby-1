class Post < ApplicationRecord
  validates :title, :start_date, :end_date, presence: true
  
  validates :title, length: { maximum: 20 }
  
  validates :memo, length: { maximum: 500 }, allow_blank: true

  def start_end_check
    if start_date && end_date && start_date > end_date
        errors.add(:end_date, "は開始日より前の日を設定はだめ") 
    end
  end
end