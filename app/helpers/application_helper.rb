module ApplicationHelper
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
end
