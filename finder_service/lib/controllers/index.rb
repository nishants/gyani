class Application < Sinatra::Base

  get "/search" do
  	query = params["query"];
  	keywords = query.split(",").map{|key| 
  		Keyword.where(text: key.downcase().strip()).first;
	}

	Search.for(keywords).to_json
  end

end
