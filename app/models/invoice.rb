class Invoice < ApplicationRecord
  belongs_to :quotation
  has_many_attached :uploads

  validates :first_name, :presence => true
  validates :last_name, :presence => true
  validates :company, :presence => true
  validates :phone, :presence => true
  validates :email, :presence => true
  validates :comments, :presence => true
  validates :equipment_type, :presence=> true
end
