require "spec_helper"

describe Application do

  context "Should sort pages by weight of query" do
    
    it "Should sort page_ids by strenght of match" do
      max_keys = 8
      key_ids_in_query      = [1, 2, 3]
      key_ids_for_page_ids  = {
        103 => [1,2,3],
        101 => [1,2],
        104 => [2,1],
        102 => [1]
      }

      sorted_page_ids = QueryWeightFunction.with_max_weight(max_keys).apply_on(key_ids_in_query, key_ids_for_page_ids)

      sorted_page_ids.should == [103, 101, 104, 102]
    end

  end
end