require 'rails_helper'

RSpec.describe Scrapper, type: :model do
  describe 'It should be a valid model' do
    it 'It should be valid without any fields' do
      translator = Scrapper.new
      expect(translator).to be_valid
    end
  end
end
