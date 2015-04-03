class Application < Sinatra::Base

  put "/pages" do
    Page.new(params).save
  end

end
