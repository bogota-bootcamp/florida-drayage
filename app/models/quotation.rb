class Quotation < ApplicationRecord
	has_many :invoices
	validates :first_name, :presence => true
	validates :last_name, :presence => true
	validates :company, :presence => true
	validates :phone, :presence => true
	validates :email, :presence => true
	validates :comments, :presence => true
end
	