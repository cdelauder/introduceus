require 'koala'

helpers do

  def set_user(token, user_id)
    @graph = Koala::Facebook::API.new(token)
    profile = @graph.get_object("me")
    photo = @graph.get_picture('me')
  end

end

