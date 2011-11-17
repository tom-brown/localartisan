class ItemImage < ActiveRecord::Base
  
  belongs_to :item
  
  has_attached_file :image, :styles => {
    :thumb=> "50x50#",
    :small => "300x300>",
    :large => "600x600"
  }, 
  
  :storage => :s3, :s3_credentials => S3_CREDENTIALS,
  :path => ":attachment/activities/:id/:style.:extension",
  :bucket => 'media.localartisan.com'
  
  # :storage => :s3,
  #     :s3_credentials => "#{RAILS_ROOT}/config/s3.yml",
  #     :path => ":attachment/activities/:id/:style.:extension",
  #     :bucket => 'media.homemadelocal.com'
  
end
