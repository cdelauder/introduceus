require 'koala'

helpers do

  def set_user(token, user_id)
    @graph = Koala::Facebook::API.new(token)
    profile = @graph.get_object("me")
    photos = @graph.get_connections('me', 'photos')
    photos =  photos.map {|json_object| json_object['source']}
    photos.sample
  end

  def get_photo(token)
    @graph = Koala::Facebook::API.new(token)
    profile = @graph.get_object("me")
    photos = @graph.get_connections('me', 'photos')
    photos =  photos.map {|json_object| json_object['source']}
    photos.sample
  end
end

