class Item < ActiveRecord::Base
  
  belongs_to :user
  has_many :images
  belongs_to :category
  has_many :favorites
  has_many :item_images, :dependent => :destroy
  accepts_nested_attributes_for :item_images, :allow_destroy => true
  validates_presence_of :title, :description, :price
  validates_numericality_of :price
end
