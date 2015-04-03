# require "spec_helper"

# describe Application do

#   before :each do
#     Page.delete_all;
#     Keyword.delete_all;

#     online      = Keyword.create(text: "online");
#     shopping    = Keyword.create(text: "shopping");
#     reviews     = Keyword.create(text: "reviews");
#     clothes     = Keyword.create(text: "clothes");
#     apparels    = Keyword.create(text: "apparels");

#     @snapdeal_page = Page.create(
#         :url => "www.snapdeal.com",
#         :keywords => [online, shopping, reviews])

#     @myntra_page = Page.create(
#         :url => "www.myntra.com",
#         :keywords => [online, clothes, apparels])

#     @flipkart_page = Page.create(
#         :url => "www.flipkart.com",
#         :keywords => [shopping, online, reviews])

#     @amazon_page = Page.create(
#         :url => "www.amazon.com",
#         :keywords => [online, reviews, shopping])
#   end

#   def to_urls pages_json
#     urls = (JSON.parse pages_json).map {|page| page["url"] }
#     urls
#   end

#   context "Should fetch result by keywords" do
#     it "should return ok" do
#       get "/search", :query => "online, shopping"

#       to_urls(last_response.body).should == [
#         "www.snapdeal.com",
#         "www.flipkart.com",
#         "www.amazon.com",
#         "www.myntra.com"]
#     end

#   end
# end