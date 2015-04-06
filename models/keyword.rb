# create a model
class Keyword < ActiveRecord::Base
	has_many :pages, :through => :keywords_pages
end
