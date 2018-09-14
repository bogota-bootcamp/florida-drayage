class Quotation < ApplicationRecord
  has_many :invoices
  
  validates :first_name, :presence => true
  validates :last_name, :presence => true
  validates :company, :presence => true
  validates :phone, :presence => true
  validates :email, :presence => true
  validates :equipment_type, :presence=> true
  validate :commodity_presence_if_hazardous
  
  EQUIPMENT_TYPES =   ["40 ft. Chassis", 
    "20 ft. Chassis",
    "45 ft. Chassis",
    "Tri-Axle Chassis",
    "Flat Rack",
    "Live Load",
    "Drop/Pick"]
  


  def suggested_price
     zipcode = Zipcode.find_by(code:self.destination_zipcode)
     zipcode ? zipcode.price : nil
  end
  
  private
  def commodity_presence_if_hazardous    
    if hazardous
      if commodity.blank?
        errors.add(:commodity, 'can\'t be blank if Hazardous is true')
      end      
    end
    
  end 


end
  
