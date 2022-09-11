class Diet < ApplicationRecord
  belongs_to :user
  validates :record_time, presence: true
  validates :body_weight, numericality: { greater_than: 0, less_than: 150 }
  validates :protein, numericality: { greater_than: 0, less_than: 1000 }
  validates :fat, numericality: { greater_than: 0, less_than: 1000 }
  validates :carbohydrate, numericality: { greater_than: 0, less_than: 1000 }

  scope :search, -> (search_params) do
    return if search_params.blank?
    from_record_time(search_params[:from_record_time]).to_record_time(search_params[:to_record_time])
  end
  
  scope :from_record_time, -> (from) { where('? <= record_time', from) if from.present? }
  scope :to_record_time, -> (to) { where('record_time <= ?', to) if to.present? }
end
