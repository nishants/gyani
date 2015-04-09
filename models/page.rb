# create a model
class Page < ActiveRecord::Base
	def self.add url
		Page.create(:url => url)
	end
	
	def self.find_by_url url
		Page.where(:url => url).first
	end	
end
