class QueryWeightFunction

  def self.with_max_weight max_keys
    QueryWeightFunction.new(max_keys)
  end	

  def initialize max_keys
    @max_keys = max_keys    
  end

  def apply_on query, pages
    query_weights         = weigh(query)
    page_key_weight_map   = weigths_on_page(pages)
    to_key_ids(page_key_weight_map)
  end  

  def sort_by_weight_against_query page_key_weight_map, query_weights
    page_key_weight_map.sort_by{|page_id, page_key_weights|
      weight_of(query_weights, page_key_weights)
    }
  end

  def weigths_on_page key_ids_on_pages
    key_ids_on_pages.each{|key, key_ids|
      key_ids_on_pages[key] = weigh(key_ids)
    }
  end

  def weigh key_ids
    weights = {}
    key_ids.each_with_index{|key_id, index|
      weights[key_id] = @max_keys - index
    }    
    return weights
  end

  def to_key_ids key_ids_and_keys_arr
    key_ids_and_keys_arr.map{|key_arr|
      key_arr.first
    }
  end  

  def weight_of query_key_weights, page_key_weights
    result = 0
    query_key_weights.each{|key, weight|
      weight_in_page = page_key_weights[key]
      weight_in_page = 0 if weight_in_page.nil?
      result += (weight_in_page * weight)
    }
    result
  end	
end
