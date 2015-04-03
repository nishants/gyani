class Application < Sinatra::Base

  put "/pages" do
  	params["keywords"] = create_if_not_exists(params.delete("keywords"));
    Page.new(params).save
  end

  def create_if_not_exists keywords
  	result = [];
  	keywords.each{ |key|
  		key = key.downcase
  		keyword = Keyword.where(text: key).first;
  		unless keyword
  			keyword = Keyword.new({text: key}) ;
  			keyword.save;
  		end
  		result.push(keyword)
  	}
  	return result;
  end

end