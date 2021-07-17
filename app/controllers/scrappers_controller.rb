class ScrappersController < ApplicationController
   include Scrapping
  def index; end

  def scrapp
    profile_url = params[:proz_profile_url]
    return redirect_to root_path if !check_url(profile_url)
    @scraped_values = scrapp_page(profile_url)
  end

  def new
    @scrapp = Scrapper.new
  end

  def create
    target_languages = format_target_languages(params[:languages])
    @scrapp = Scrapper.new(first_name: params["first_name"],
    last_name: params["last_name"],country: params["country"],native_language: params["native_language"],target_language: target_languages,source:  params["source"])
    if @scrapp.save
      redirect_to scrapp_all_path
    end
  end
  
  def all
    @scrapped = Scrapper.all
  end
  
  
  
end
