class HomeController < ApplicationController
  layout "home"
  def home 
    @hero_img = HeroImage.first
    @hero_url = @hero_img.image.url 
  end
end
