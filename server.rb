require 'sinatra'
require 'pry'
require 'csv'

STORAGE = 'tasks.csv'

get '/' do
  @tasks = []
  CSV.foreach(STORAGE, headers: true) do |row|
    @tasks << row
  end

  erb :index
end

post '/tasks' do
  task = params['task_name']
  due_date = params['due_date']

  File.open(STORAGE, 'a') do |file|
    file.puts("#{task},#{due_date}")
  end

  redirect '/'
end

# set :views, File.dirname(__FILE__) + '/views'
# set :public_folder, File.dirname(__FILE__) + '/public'
