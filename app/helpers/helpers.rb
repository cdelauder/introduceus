require 'koala'

helpers do

  def set_user(token)
    @graph = Koala::Facebook::API.new(token)
    get_photos(token)
    select_photo
  end

  def get_photos(token)
    query_result = @graph.get_connections('me', 'photos', {limit: 100})
    add_photos_to_db(query_result)
  end

  def add_photos_to_db(query_result)
    # collection = Koala::Facebook::GraphCollection.new(query_result, @graph)
    # p collection.parse_page_url(url)
    photos =  query_result.map {|json_object| json_object['source']}
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

