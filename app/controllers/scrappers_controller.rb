class ScrappersController < ApplicationController
   include Scrapping
  def index; end

  def scrapp
    profile_url = params[:proz_profile_url]
    
    @scraped_values = scrapp_page(profile_url)
   
  end

  def new
    @scrapp = Scrapper.new
  end

  def create
    @scrapp = Scrapper.new(first_name: params["first_name"],
    last_name: params["last_name"],country: params["country"],native_language: params["native_language"])
    if @scrapp.save
      redirect_to scrapp_all_path
    end
    puts '-------------Reached this part---------------'

  end
  
  def all
    @scrapped = Scrapper.all
  end
  
  
  
end
