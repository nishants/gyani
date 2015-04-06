class Application < Sinatra::Base
  
  put "/pages" do
    params    = JSON.parse(request.body.read)
    keywords  = keywords_for(params["keywords"])
    page      = Page.add(params["url"])
    create_mapping(page, keywords)
  end

  def keywords_for key_texts
    key_texts.map{|key|
      key     = key.downcase().strip()      
      keyword = Keyword.find_by_text(key)
      keyword.nil? ? Keyword.add(key) : keyword
    }
  end

  def create_mapping page, keywords
    KeyMap.add(page, keywords)
  end
end