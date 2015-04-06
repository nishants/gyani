class Application < Sinatra::Base

  get "/search" do
    PageSearch.search_pages_with(keywords_from(params["query"])).to_json
  end

  def keywords_from query
    keywords = query.split(",").map{|key| 
      key =key.downcase().strip()
      Keyword.find_by_text(key)
    }
  end
end