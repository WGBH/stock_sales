class SidekickImage < ActiveRecord::Base

  validates_presence_of :title
  validates_presence_of :alt
  validates_presence_of :image
  validates_presence_of :url
  validates_presence_of :order
end
