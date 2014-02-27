require 'id3tag'

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
      File.open(@album_proxy_file) do |file|
        id3_tag = ID3Tag::read file
        artist = id3_tag.artist
        @metadata[:artist] = artist unless artist.empty?
        album_title = id3_tag.album
        @metadata[:album_title] = album_title unless album_title.empty?
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