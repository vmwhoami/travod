class ScrappersController < ApplicationController
  require 'nokogiri'
  require 'httparty'
  require 'open-uri'

  def index; end

  def scrapp
    profile_url = params[:proz_profile_url]
    unparsed = HTTParty.get(profile_url)
    doc = Nokogiri::HTML(unparsed)

    @first_name = get_name(doc)[0]
    @last_name = get_name(doc)[1]
    @country = get_country(doc)
    @native_language = get_language(doc)
    @target_language = get_target_language(doc) - [@native_language]
    @source = profile_url
    byebug

    # br = doc.xpath('//span[@id="tagline"]').first.next_element
    # nextbr =br.next_element
    # location = nextbr.next_element.children[0].text.split[-1]
  end

  def get_name(doc)
    arr = doc.search('strong')[1].children.text.strip.split
    first_name = arr.shift
    family_name = arr.join(' ')
    [first_name, family_name]
  end

  def get_language(doc)
    lang = doc.search('.pd_bot').children.text.split(' ')[-1]
    lang[0...-1]
  end

  def get_target_language(doc)
    arr = []
    doc.search('#lang_full').children.each do |span|
      arr << span.text.split(' to ')
    end
    arr.reject { |c| c.empty? }.flatten.uniq
  end

  def get_country(doc)
     br = doc.xpath('//span[@id="tagline"]').first.next_element
    nextbr =br.next_element
    location = nextbr.next_element.children[0].text.split[-1]
  end
  


end
