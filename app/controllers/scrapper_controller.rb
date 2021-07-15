class ScrapperController < ApplicationController
  def index
  end

  def scrapp
    puts "This is the querry field #{params[:query]}"
  end
end
