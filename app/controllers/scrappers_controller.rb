class ScrappersController < ApplicationController
   include Scrapping
  def index; end

  def scrapp
    profile_url = params[:proz_profile_url]
    scraped_val = scrapp_page(profile_url)
    
  end

 
  
    
 

end
