require('sinatra')
require('sinatra/reloader')
require_relative('models/student')
require_relative('models/house')
also_reload('./models/*')

# index
get '/students' do
  @students = Student.all
  erb( :index )
end

# new
get '/students/new' do
  @houses = House.all
  erb( :new )
end

# create
post '/students' do
  Student.new(params).save
  redirect '/students'
end

# show
get '/students/:id' do
  @student = Student.find(params['id'])
  erb( :show )
end

# edit
get '/students/:id/edit' do
  @houses = House.all
  @student = Student.find(params['id'])
  erb( :edit )
end

# update
put '/students/:id' do
  Student.new(params).update
  redirect '/students'
end

# destroy
delete '/students/:id' do
  Student.find(params['id']).delete
end
