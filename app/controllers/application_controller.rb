class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  def get_categories
    @categories = ""
    mechanize = Mechanize.new
    page = mechanize.get("http://www.alexa.com/topsites/category")
    page./('.categories.top ul').each do |ul|
      ul./('li').each do |li|
        @categories += (" " + li./('a').first.text.downcase + li./('a').first.text)
      end
    end 
    @categories.gsub('and', '')
  end
  
  def checkURL(url)
    !!(url =~ /^(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(([0-9]{1,5})?\/.*)?$/ix)
  end
end
