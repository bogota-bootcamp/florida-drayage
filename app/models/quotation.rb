class Quotation < ApplicationRecord
  has_many :invoices

  validates :first_name, :presence => true
  validates :last_name, :presence => true
  validates :company, :presence => true
  validates :phone, :presence => true
  validates :email, :presence => true
  validates :equipment_type, :presence=> true
  validates :additional_service, :presence=> true
  validate :commodity_presence_if_hazardous

  EQUIPMENT_TYPES = [
    "20ft chassis",
    "20ft triaxle chassis",
    "20ft flat rack",
    "20ft open top",
    "20ft container",
    "40ft chassis",
    "40ft triaxle chassis",
    "40ft flat rack",
    "40ft open top",
    "45ft container"
  ]

  PORT = [
    "Port Miami",
    "Port Everglades",
    "Port of Palm Beach",
    "Port of Tampa Bay",
    "FEC"
  ]

  ADDITIONAL_SERVICES = [
    "Live Load",
    "Drop/Pick"
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
