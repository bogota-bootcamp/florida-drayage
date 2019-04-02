class Quotation < ApplicationRecord
  has_many :invoices
  
  validates :first_name, :presence => true
  validates :last_name, :presence => true
  validates :company, :presence => true
  validates :phone, :presence => true
  validates :email, :presence => true
  validates :equipment_type, :presence=> true
  validate :commodity_presence_if_hazardous
  
  EQUIPMENT_TYPES = [ 
    "20 ft. Container",
    "45 ft. Container",
    "Live Load",
    "Drop/Pick"
  ]

  ORIGIN_CITY = [
    "Port Miami",
    "Port Everglades",
    "Port of Palm Beach",
    "Port of Tampa Bay",
    "FEC"
  ]
  


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
  
