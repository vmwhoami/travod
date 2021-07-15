class ScrapperController < ApplicationController

  require 'nokogiri'
  require 'open-uri'

  def index
  end

  def scrapp
    @profile_url = params[:proz_profile_url]
    proz = Nokogiri::HTML(URI.open(@profile_url))
    proz.xpath('//tbody//table//strong', '//table//strong').each do |link|
      puts link.content
    end
  end
end

