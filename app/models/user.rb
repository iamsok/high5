class User < ActiveRecord::Base
  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth["provider"]
      user.uid = auth["uid"]
      user.name = auth["info"]["name"]
      user.token = auth["credentials"]["token"]
    end
  end

  def friends(token)
    @graph = Koala::Facebook::API.new(token, ENV['FACEBOOK_SECRET'])
    @graph.get_connections("me", "friends", "statuses", "message")
  end

end
