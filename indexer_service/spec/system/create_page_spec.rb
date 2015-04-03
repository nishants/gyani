require "spec_helper"

describe Application do

  before :each do
    Page.delete_all
    Keyword.delete_all
  end

  context "Add a page" do
    it "should  ok" do
      put "/pages", {url: "www.geeksaint.com", keywords: ["Ford", "Car"] };
      last_response.status.should == 200;
      created_page = Page.all()[0];
      created_page.url.should == "www.geeksaint.com";
      Keyword.all().length.should == 2;

    end

    it "should create a keyword, only if it doesnt already exists in the db." do
      Keyword.new(text: "FORd").save;
      fordKey = Keyword.all().first;

      put "/pages", {url: "www.geeksaint.com", keywords: ["Ford", "Car", "Review"] };
      last_response.status.should == 200;

      fordKey.id.should == Keyword.where(text: "Ford").first.id;

      Keyword.all().length.should == 3;
    end

  end

end
