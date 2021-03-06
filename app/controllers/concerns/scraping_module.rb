module ScrapingModule
  extend ActiveSupport::Concern

  def format_target_languages(target_languages)
    target_languages.join(' / ')
  end

  def check_url(url)
    return true if url.include? 'https://www.proz.com/'

    false
  end

  def scrapp_page(url)
    unparsed = HTTParty.get(url)
    doc = Nokogiri::HTML(unparsed)
    first_name = name(doc)[0]
    last_name = name(doc)[1]
    country = country(doc)
    native_language = language(doc)
    target_language = target_language(doc) - [native_language]
    source = url
    hash = {}
    hash['first_name'] = first_name
    hash['last_name'] = last_name
    hash['country'] = country
    hash['native_language'] = native_language
    hash['target_language'] = target_language
    hash['source'] = source
    hash
  end

  def name(doc)
    arr = doc.search('strong')[1]
    return if arr.nil?

    text = arr.children.text.strip.split
    first_name = text.shift
    family_name = text.join(' ')
    [first_name, family_name]
  end

  def language(doc)
    lang = doc.search('.pd_bot').children.text.split[-1]

    return 'No language defined' if lang[0...-1] == 'languages'

    lang[0...-1]
  end

  def target_language(doc)
    arr = []
    doc.search('#lang_full').children.each do |span|
      arr << span.text.split(' to ')
    end
    arr.reject(&:empty?).flatten.uniq.reject { |c| c.strip.downcase == 'less' }
  end

  def country(doc)
    br = doc.xpath('//span[@id="tagline"]')
    return if br.empty?

    br = br.first.next_element
    nextbr = br.next_element
    nextbr.next_element.children[0].text.split(',')[-1]
  end
end
