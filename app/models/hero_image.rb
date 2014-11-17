class HeroImage < ActiveRecord::Base

  validates_presence_of :title
  validates_presence_of :alt
  validates_presence_of :image
end
