require 'rails_helper'

describe HeroImage do

  describe '.new' do
    it 'is not valid without title' do
      heroimg = HeroImage.new(alt: 'alt', image: 'image')
      expect(heroimg).to_not be_valid
    end
    
    it 'is not valid without alt' do
      heroimg = HeroImage.new(title: 'title', image: 'image')
      expect(heroimg).to_not be_valid
    end

    it 'is not valid without image' do
      heroimg = HeroImage.new(title: 'title', alt: 'alt')
      expect(heroimg).to_not be_valid
    end

    it 'is valid with title, alt, and image' do
      heroimg = HeroImage.new(title: 'title', alt: 'alt', image: 'image')
      expect(heroimg).to be_valid
    end
  end
end
