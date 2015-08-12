# Homepage (Root path)

configure do
  enable :sessions
end


get '/' do
  # @user = User.find(session[:id])
  erb :index
end 

get '/login' do
  erb :'/login/index'
end

get '/logout' do
  session.clear
  redirect '/login'
end

post '/login' do

  @user = User.find_by(user_name: params[:user_name], password: params[:password])  
  if @user
    session[:id] = @user.id 
    session[:user_name] = @user.user_name
    redirect '/songs'
  elsif params[:user_name] && params[:password] == settings.password 
    session[:admin] = true
    redirect to ('/songs')
  else
    erb :'/login/index'
  end 
end

get '/songs' do
  @songs = Song.all
  erb :'songs/index'
end

get '/songs/new' do
  @song = Song.new
  erb :'songs/new'
end

post '/songs' do
  @song = Song.new(
    title: params[:title],
    artist: params[:artist],
    lyrics: params[:lyrics],
    url: params[:url], 
    album_cover: params[:album_cover]
    )
  if @song.save
    redirect '/songs'
  else  
    erb :'songs/new'
  end 
end


get '/songs/show/:id' do
  @song = Song.find params[:id]
  erb :'songs/show'
end

# get '/songs/upvote/:id' do
#   @song = Song.find params[:id]
#   erb :'songs/upvote'
# end

get '/users' do
  @user = User.all
  erb :'users/index'
end

get '/users/new' do
  @user = User.new
  erb :'users/new'  
end

get '/users/show' do
  @user = User.find(session[:id])
  erb :'users/show'
end



post '/users/new' do 
  @user = User.new(
    user_name: params[:user_name],
    password: params[:password],
    email: params[:email])
 if @user.save
    redirect to ('/users')
  else
    erb :'users/new'
  end
end

get '/users/show/:id' do
  @user = User.find params[:id]
  erb :'users/show'
end


# get '/songs/edit' do
#   @song = Song.find(params[:id])
#   erb :edit_song
# end

# get 'songs/:id/edit' do
#   @song = Song.find(params[:id])
#   erb :edit_song
# end

# post '/songs/edit' do
#   @song= Song.find(params[:id])
#     title = params[:title],
#     artist = params[:artist],
#     lyrics = params[:lyrics],
#     url = params[:url], 
#     album_cover = params[:album_cover] 

#     @song.update_attributes(title: title, artist: artist, lyrics: lyrics)
#     redirect '/songs'

# end
# get '/setcookie' do
#   response.set_cookie 'foo', 'bar'
#   redirect to ('/songs')
# end

# get '/readcookie' do
#   request.cookies['foo']
# end

# get '/set/:username' do
#   session [:username] = params[:username]
#   redirect to ('/songs')
# end

# get '/get/sessions' do
# 'Welcome #{session[:username]}, Logout here.s'
# end