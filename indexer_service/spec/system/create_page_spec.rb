require "spec_helper"

describe Application do

  before :each do
    Page.delete_all
    Keyword.delete_all
  end

  context "Add a page" do
    it "should  ok" do
      put "/pages", {"url" =>"www.geeksaint.com", "keywords"=>["Ford", "Car", "Review"]}.to_json ;
      last_response.status.should == 200;
      created_page = Page.all()[0];
      created_page.url.should == "www.geeksaint.com";
      created_page.keywords.should == [
        Keyword.where(text: "ford").first,
        Keyword.where(text: "car").first,
        Keyword.where(text: "review").first
        ];


    end

    it "should create a keyword, only if it doesnt already exists in the db." do
      Keyword.new(text: "ford").save;
      fordKey = Keyword.all().first;

      put "/pages", {url: "www.geeksaint.com", keywords: ["ForD", "CaR", "Review"] }.to_json;
      last_response.status.should == 200;

      fordKey.id.should == Keyword.where(text: "Ford").first.id;

      Keyword.all().length.should == 3;
    end

  end

end
