require 'sinatra'

get '/' do
  @tasks = File.readlines('tasks')
  erb :index
end

post '/tasks' do
  # Read the input from the form the user filled out
  task = params['task_name']

  # Open the "tasks" file and append the task
  File.open('tasks', 'a') do |file|
    file.puts(task)
  end

  # Send the user back to the home page which shows
  # the list of tasks
  redirect '/'
end

# These lines can be removed since they are using the default values. They've
# been included to explicitly show the configuration options.
set :views, File.dirname(__FILE__) + '/views'
set :public_folder, File.dirname(__FILE__) + '/public'
