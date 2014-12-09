class HomeController < ApplicationController
  layout "home"
  def home 
    @hero_img = HeroImage.first
    @sidekick_imgs = SidekickImage.order(order: :asc).limit(4)
  end
end
