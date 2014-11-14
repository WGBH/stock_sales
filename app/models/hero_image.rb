class HeroImage < ActiveRecord::Base
  attr_accessor :title, :alt, :image

  validates_presence_of :title
  validates_presence_of :alt
  validates_presence_of :image
end
