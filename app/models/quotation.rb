class Quotation < ApplicationRecord
	has_many :invoices
	
	validates :first_name, :presence => true
	validates :last_name, :presence => true
	validates :company, :presence => true
	validates :phone, :presence => true
	validates :email, :presence => true
	validates :comments, :presence => true
	

	def origin_zipcode_object
		 zipcode= Zipcode.find(self.origin_zipcode) if self.origin_zipcode
	end	

	def destination_zipcode_object
		zipcode= Zipcode.find(self.destination_zipcode) if self.destination_zipcode
	end
end
	