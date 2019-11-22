require 'koala'

class FacebookManager
  def self.app_connection
    Koala::Facebook::OAuth.new('2165917247048594', '25d127c7b66907637f422d825bad5239')
  end

  def self.connection(token_id)
    app_connection
    Koala::Facebook::API.new(token_id)
  end

  def self.publish(message, visual, token_id)
    connection(token_id).put_connections('me', 'feed', message: message)
  end
end
