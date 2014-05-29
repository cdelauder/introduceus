require 'koala'

helpers do

  def set_user(token, user_id)
    @graph = Koala::Facebook::API.new(token)
    get_photos(token)
    select_photo
  end

  def get_photos(token)
    photos = @graph.get_connections('me', 'photos')
    photos =  photos.map {|json_object| json_object['source']}
    photos.each {|photo| Photo.create(source: photo)}
  end

  def select_photo
    if Photo.all.empty?
      set_user(session[:token])
    else
      photo = Photo.all.sample
      Photo.delete(photo)
      photo.source
    end
  end

end

