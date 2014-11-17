require 'rails_helper'

describe SidekickImage do

  describe '.new' do
    it 'is not valid without title' do
      sidekick = SidekickImage.new(alt: 'alt', image: 'image', url: 'url', order: 3)
      expect(sidekick).to_not be_valid
    end
   
    it 'is not valid without alt' do
      sidekick = SidekickImage.new(title: 'title', image: 'image', url: 'url', order: 3)
      expect(sidekick).to_not be_valid
    end
 
    it 'is not valid without image' do
      sidekick = SidekickImage.new(title: 'title', alt: 'alt', url: 'url', order: 3)
      expect(sidekick).to_not be_valid
    end

    it 'is not valid without url' do
      sidekick = SidekickImage.new(title: 'title', alt: 'alt', image: 'image', order: 3)
      expect(sidekick).to_not be_valid
    end

    it 'is not valid without order' do
      sidekick = SidekickImage.new(title: 'title', alt: 'alt', image: 'image', url: 'url')
      expect(sidekick).to_not be_valid
    end

    it 'is valid with all of the above attributes' do
      sidekick = SidekickImage.new(title: 'title', alt: 'alt', image: 'image', url: 'url', order: 3)
      expect(sidekick).to be_valid
    end
  end
end
