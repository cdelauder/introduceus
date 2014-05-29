get '/' do
  erb :login
end

post '/login' do
  session[:token] = params[:token]
  @photo = set_user(session[:token])
  content_type JSON
  {photo: @photo}.to_json
end

post '/photo' do
  @photo = select_photo
  content_type JSON
  {photo: @photo}.to_json
end

get '/logout' do
  Photo.delete_all
  status 200
end


