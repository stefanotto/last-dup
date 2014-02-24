require 'lastfm'
require 'singleton'

module LastDup
  class LastfmEnquirer
    include Singleton

    def initialize(user='pppr')
      @api_key = Settings[:api_key]
      @api_secret = Settings[:api_secret]
      @connection = Lastfm.new(@api_key, @api_secret)
      @username = Settings[:username]
    end
    
    def i_have_heart_this?(album)
      query = {
        'artist' => album.metadata[:artist],
        'album' => album.metadata[:album_title],
        'username' => @username
      }
      result = @connection.album.get_info(query)
      return result.has_key? 'userplaycount'
    rescue Lastfm::ApiError
    # album not found
      return false
    end

  end

end