require "spec_helper"

describe Application do

  before :each do
    Page.delete_all
    Keyword.delete_all
  end
  
  context "Indexer" do
    it 'should fetch page and keywords' do
      put "/pages", {"url" =>"www.snapdeal.com", "keywords"=>["online", "shopping", "review"]}.to_json ;
      put "/pages", {"url" =>"www.flipkart.com", "keywords"=>["shopping", "review", "online"]}.to_json ;

      Keyword.find_by_text("online").should_not be_nil
      Keyword.find_by_text("shopping").should_not be_nil
      Keyword.find_by_text("review").should_not be_nil

      Page.find_by_url("www.snapdeal.com").should_not be_nil;
      Page.find_by_url("www.flipkart.com").should_not be_nil;;

      index_for_shopping = Index.mappings_for([Keyword.find_by_text("shopping")])
      urls_in(index_for_shopping).should =~ ["www.flipkart.com", "www.snapdeal.com"]      
    end

    def urls_in index
       index.map{|index|
          Page.find_by_id(index.page_id).url
       } 
    end
  end
end
