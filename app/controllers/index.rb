

get '/' do
  # render home page
 #TODO: Show all users if user is signed in
  p session
  @users = User.all
  erb :index
end

#----------- SESSIONS -----------

get '/sessions/new' do
  # render sign-in page 
  erb :sign_in
end

post '/sessions' do
  # sign-in
  user = User.authenticate(params[:email], params[:password])
  unless user.nil?
    session[:current_user] = user
  end
  redirect '/'
end

delete '/sessions/:id' do
  # sign-out -- invoked via AJAX
  session[:current_user] = nil
end

#----------- USERS -----------

get '/users/new' do
  # render sign-up page
  erb :sign_up
end

post '/users' do
  # sign-up a new user
  user = User.new(params[:user])
  user.password = params[:password]
  user.save
  session[:current_user] = user
  redirect '/'
end
