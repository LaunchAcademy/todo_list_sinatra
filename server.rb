require 'sinatra'

get '/' do
  @tasks = ['pay bills', 'buy milk', 'learn Ruby']
  erb :index
end

# These lines can be removed since they are using the default values. They've
# been included to explicitly show the configuration options.
set :views, File.dirname(__FILE__) + '/views'
set :public_folder, File.dirname(__FILE__) + '/public'
