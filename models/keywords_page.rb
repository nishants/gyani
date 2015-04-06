# create a model
class KeywordsPage < ActiveRecord::Base
	belongs_to :keyword
	belongs_to :page
end
