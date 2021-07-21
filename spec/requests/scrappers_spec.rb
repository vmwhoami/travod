require 'rails_helper'

RSpec.describe 'Scrappers', type: :request do
  describe 'Post /scrapp' do
    it 'Redirects with a wrong url' do
      post scrapp_path, params: { proz_profile_url: 'something' }
      expect(response).to have_http_status(302)
    end
  end
end
