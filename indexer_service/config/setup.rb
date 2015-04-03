require 'sinatra'
require 'active_record'

#load configurations
require File.expand_path(File.dirname(__FILE__) + '/properties')

# Include all source code files from root/lib/*
Dir.glob("./lib/**/*.rb"){|f| require f }

def setup_db()
	db_config = db_config_from_properties(ENV['RACK_ENV']);
  ActiveRecord::Base.establish_connection(
      :adapter  => db_config["adapter"],
      :host     => db_config["host"],
      :username => db_config["user"],
      :password => db_config["password"],
      :database => db_config["name"]
  )
end
puts ENV["RACK_ENV"];
setup_db();
