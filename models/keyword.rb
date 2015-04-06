# create a model
class Keyword < ActiveRecord::Base
	def self.find_by_text text 
		Keyword.where(text: text).first
	end
	
	def self.add text 
		Keyword.create({text: text})
	end

end
