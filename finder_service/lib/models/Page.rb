# create a model
class Page < ActiveRecord::Base
	has_and_belongs_to_many :keywords , :through => :keywords_pages
end
