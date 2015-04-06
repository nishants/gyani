require "spec_helper"

describe Application do

  before :each do
    Page.delete_all;
    Keyword.delete_all;

    online      = Keyword.add("online")
    shopping    = Keyword.add("shopping")
    reviews     = Keyword.add("reviews")
    clothes     = Keyword.add("clothes")
    apparels    = Keyword.add("apparels")

    snapdeal  = Page.add("www.snapdeal.com")
    myntra    = Page.add("www.myntra.com")
    flipkart  = Page.add("www.flipkart.com")
    amazon    = Page.add("www.amazon.com")   

    KeyMap.add(snapdeal, [online, shopping, reviews])
    KeyMap.add(myntra, [online, clothes, apparels])
    KeyMap.add(flipkart,[shopping, online, reviews])
    KeyMap.add(amazon, [online, reviews, shopping])
  end

  context "Should fetch result by keywords" do
    it "should search based on weight of keywords in query and page." do
      get "/search", :query => "online, shopping"

      to_urls(last_response.body).should == [
        "www.snapdeal.com",
        "www.flipkart.com",
        "www.amazon.com",
        "www.myntra.com"
      ]
    end
  end

  def to_urls pages_json
    JSON.parse(pages_json).map {|page| page["url"] }
  end  
end