class User < ActiveRecord::Base
  
  has_secure_password
  
  has_many :items
  
  has_many :favorites
  
  belongs_to :neighborhood
  
  has_one :state
  
  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :first_name, :last_name,  :presence => true,
                                     :length   => { :maximum => 50 }
  validates :email,                   :presence => true,
                                      :format   => { :with => email_regex },
                                      :uniqueness => { :case_sensitive => false }
  
  validates :zip, :numericality => true, :length => {:is => 5}
    
  geocoded_by :full_address
  after_validation :geocode, :if => :address_changed?  
    
  def full_address
    [address, city, @state, zip].compact.join(', ')
  end
end
