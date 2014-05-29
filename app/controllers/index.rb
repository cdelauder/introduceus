get '/' do
  erb :login
end

post '/login' do
  session[:token] = params[:token]
  @photo = set_user(session[:token], session[:user_id])
  content_type JSON
  {photo: @photo}.to_json
end

post '/photo' do
  @photo = get_photo(session[:token])
  content_type JSON
  {photo: @photo}.to_json
end


