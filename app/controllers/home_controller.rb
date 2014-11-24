class HomeController < ApplicationController
  layout "home"
  def home 
    @hero_img = HeroImage.first
    @sidekick_imgs = []
    (1..4).each do |n|
      @sidekick_imgs << (SidekickImage.find_by order: n)
    end
  end
end
