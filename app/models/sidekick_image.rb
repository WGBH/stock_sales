class SidekickImage < ActiveRecord::Base
  mount_uploader :image, SidekickImageUploader

  validates_presence_of :title
  validates_presence_of :alt
  validate :must_have_image_file
  validates_presence_of :url
  validates_presence_of :order

  def must_have_image_file
    if image.file.nil? || image.file.file.blank?
      errors.add(:image, "file must be present")
    end
  end
end
