# create a model
class Page < ActiveRecord::Base
	has_many :keywords_pages 
	has_many :keywords , :through => :keywords_pages
end
