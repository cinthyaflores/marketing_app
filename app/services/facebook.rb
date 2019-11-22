require 'koala'

class FacebookManager
  def self.app_connection
    Koala::Facebook::OAuth.new('', '')
  end

  def self.connection(token_id)
    app_connection
    Koala::Facebook::API.new(token_id)
  end

  def self.publish(message, visual, token_id)
    connection(token_id).put_connections('me', 'feed', message: message)
  end
end
