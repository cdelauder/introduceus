get '/' do
  erb :login
end

post '/login' do
  session[:token] = params[:token]
  set_user(session[:token], session[:user_id])
  p @user
end

