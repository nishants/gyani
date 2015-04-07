class Search
  def self.for(keywords)
    Search.new(keywords, Page.all()).result();
  end

  def initialize(keywords, pages)
    @query = Query.new(keywords);
    @pages = pages;
  end

  def result
    search_result = {};
    @pages.each { |page|
      weight = @query.weight_of(page)
      search_result[weight] = page if(weight > 0)
    }
    search_result.sort_by {|weight, page| weight}.map {|value| value[1]}.reverse
  end
end
