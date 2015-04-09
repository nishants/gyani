class Application < Sinatra::Base
  
  put "/pages" do
    params    = JSON.parse(request.body.read)
    keywords  = keywords_for(params["keywords"])
    page      = Page.add(params["url"])
    create_mapping(page, keywords)
    status 200
  end

  def keywords_for key_texts
    key_texts.map{|key|
      key     = key.downcase().strip()      
      keyword = Keyword.find_by_text(key)
      keyword.nil? ? Keyword.add(key) : keyword
    }
  end

  def create_mapping page, keywords
    Index.put(page, keywords)
  end
end