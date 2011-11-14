class ItemImage < ActiveRecord::Base
  
  belongs_to :item
  
  has_attached_file :image, :styles => {
    :thumb=> "50x50#",
    :small => "300x300>",
    :large => "600x600"
  }
  
end
