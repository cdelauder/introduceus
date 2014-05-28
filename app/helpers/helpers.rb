require 'fb_graph'
helpers do

  def set_user(token, user_id)
    @user = FbGraph::User.new('me', :access_token => token).fetch
    p @user

    # p "OK"
    # p @user = FbGraph::User.me('CAAUnvNZCFO7UBABdNUiaiZBs5HA9ziRLP8ZAeqLdjbpMnzKqmLkZCPJDXAZA6vZB73t7MIxFpGjD1ZBZCsohWCOYpMTch632QeRu13DJXvljab4Nc4JcOYgKca9kWIfzX6XZAoU5BPOZC7ueDebdEfipEspki8c5wC8ZAtnwC3ULZBaZATY2kUVLjzpP1PPZBOLVly07gZD')
    # p @user1 = FbGraph::User.fetch(token: token)
    p '*****'
    p @friends = FbGraph::User.me(token).friends
    p '*****'
  end

end