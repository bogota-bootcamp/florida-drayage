class Invoice < ApplicationRecord
  belongs_to :quotation
  has_many_attached :uploads
end
