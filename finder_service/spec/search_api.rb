# require "spec_helper"

# describe Application do

#   before :each do
#     Page.delete_all;
#     Keyword.delete_all;

#     @online      = Keyword.add("online")
#     @shopping    = Keyword.add("shopping")
#     @reviews     = Keyword.add("reviews")
#     @clothes     = Keyword.add("clothes")
#     @apparels    = Keyword.add("apparels")

#     @snapdeal  = Page.add("www.snapdeal.com")
#     @myntra    = Page.add("www.myntra.com")
#     @flipkart  = Page.add("www.flipkart.com")
#     @amazon    = Page.add("www.amazon.com")   

#     KeyMap.put( @snapdeal,  [@online, @shopping, @reviews])
#     KeyMap.put( @flipkart,  [@shopping, @online, @reviews])
#     KeyMap.put( @myntra,    [@clothes, @apparels, @online])
#     KeyMap.put( @amazon,    [@reviews, @shopping])
#   end

#   context "Should search with top results by query weight" do
    
#     it "Should search with top results by query weight" do
      
#       search_result = Search.for([@online]).select_by(QueryWeightFunction.with_max_weight(8))  

#       search_result.top(1).should == [@snapdeal]
#       search_result.top(2).should == [@snapdeal, @flipkart]
#       search_result.top(3).should == [@snapdeal, @flipkart, @myntra]
#       search_result.top(4).should == [@snapdeal, @flipkart, @myntra]
#     end

#   end
# end