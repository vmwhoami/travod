class ScrappersController < ApplicationController
   include Scrapping
  def index; end

  def scrapp
    profile_url = params[:proz_profile_url]
    @scraped_values = scrapp_page(profile_url)
   
  end

  def create
    @scrapp = Scrapper.new

  end
  
  def all
    @scrapped = Scrapper.all
  end
  
  
    
 

end
