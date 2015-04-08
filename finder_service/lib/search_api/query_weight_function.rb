class QueryWeightFunction

  def self.with_max_weight max_keys
    QueryWeightFunction.new(max_keys)
  end	

  def initialize max_keys
    @max_keys = max_keys    
  end

  def for keywords_in_query
    @keywords_in_query = keywords_in_query
    self
  end

  def apply_on page_indices
    page_indices.sort{|page_index_one, page_index_two|
      search_weight_of(page_index_two) <=> search_weight_of(page_index_one)
    }
  end

  def search_weight_of page_index
    result = 0
    @keywords_in_query.each{|key|
      result += (weight_in_query(key) * weight_on_page(key, page_index))
    }
    result
  end

  def weight_in_query key
    @max_keys - @keywords_in_query.index(key)
  end

  def weight_on_page key, page_index
    index_on_page = page_index.index_of(key)
    index_on_page.nil? ? 0 : (@max_keys - index_on_page)
  end
end
