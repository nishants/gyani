class Application < Sinatra::Base

  get "/search" do
    Search.search_for(keywords_from(params["query"])).to_json
  end

  def keywords_from query
    keywords = query.split(",").map{|key| 
      Keyword.find_by_text(key.downcase().strip())
    }
  end
end