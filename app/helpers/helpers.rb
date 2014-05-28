require 'fb_graph'
helpers do

  def set_user(token, user_id)
    @user = FbGraph::User.new('me', :access_token => token).fetch
    p @user.permissions

    # p @user.friends.fetch(user_id.to_i)
    # p @friends = FbGraph::User.me(:access_token => token).friends
    p '*****'
  end

end

