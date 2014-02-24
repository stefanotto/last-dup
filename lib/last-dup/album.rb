require 'mp3info'

module LastDup

  class Album

    attr_reader :metadata, :folder_name

    def initialize(folder_name)
      @folder_name = folder_name
      @album_proxy_file = Dir.glob("#{folder_name}/*.mp3")[0]
      grab_metadata!
    end


    def grab_metadata!()
      @metadata = {}
      Mp3Info.open(@album_proxy_file) do |proxy_file|
        break unless proxy_file.hastag?
        artist = proxy_file.tag.artist
        @metadata[:artist] = artist unless artist.nil?
        album_title = proxy_file.tag.album
        @metadata[:album_title] = album_title unless album_title.nil?
      end
      @metadata
    end

    def tags_are_present?(*tags)
      tags.each do |tag|
        return false unless @metadata.has_key? tag
      end
      return true
    end

    protected :grab_metadata!

  end
end