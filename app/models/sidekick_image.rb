class SidekickImage < ActiveRecord::Base
  attr_accessor :title, :alt, :image, :url, :order

  validates_presence_of :title
  validates_presence_of :alt
  validates_presence_of :image
  validates_presence_of :url
  validates_presence_of :order
end
