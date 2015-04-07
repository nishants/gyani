class QueryWeightFunction

  def self.with_max_weight max_keys
    QueryWeightFunction.new(max_keys)
  end	

  def initialize max_keys
    @max_keys = max_keys
  end

  def apply_on key_ids, key_ids_on_pages
  	to_key_ids(key_ids_on_pages.sort_by {|key, key_ids_on_page|
  		weight_of(key_ids, key_ids_on_page)
  	}.reverse)
  end  

  def to_key_ids key_ids_and_keys_arr
    key_ids_and_keys_arr.map{|key_arr|
      key_arr.first
    }
  end  

  def weight_of key_ids, search_for_key_ids
  	weight = 0
  	key_ids.each_with_index{|key_id, index|
  		index_on_page = search_for_key_ids.index(key_id)
  		weight += (index * (index_on_page.nil? ? 0: index_on_page))
  	}
  	weight
  end	
end
