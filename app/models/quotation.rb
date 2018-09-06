class Quotation < ApplicationRecord
  has_many :invoices
  
  validates :first_name, :presence => true
  validates :last_name, :presence => true
  validates :company, :presence => true
  validates :phone, :presence => true
  validates :email, :presence => true
  validates :comments, :presence => true
  validates :equipment_type, :presence=> true
  
  EQUIPMENT_TYPES =   ["40 ft. Chassis", 
    "20 ft. Chassis",
    "45 ft. Chassis",
    "Tri-Axle Chassis",
    "26 Ft. Trucks",
    "Power Units",
    "Flatbeds",
    "Step Deck Trailers",
    "53 Ft. Trailers"]
    
  def suggested_price
     zipcode = Zipcode.find_by(code:self.destination_zipcode)
     zipcode ? zipcode.price : nil
  end 

end
  
