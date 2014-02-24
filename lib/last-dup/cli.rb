require "last-dup"
require "singleton"

module LastDup
  class Cli
    include Singleton
    include Helper
    
    def run

      if Settings.rest.empty?
        input_folder = "."
      else
        input_folder = Settings.rest[0]
      end

      input_folder = File.expand_path(input_folder)

      unless File.directory?(input_folder)
        puts "#{input_folder} is not a valid folder!"
      end

      music_folders = gather_music_folders(input_folder)
      lastfm = LastfmEnquirer.instance

      music_folders.each do |folder_name|
        album = Album.new(folder_name)
        next unless album.tags_are_present?(:artist, :album_title)
        if lastfm.i_have_heart_this?(album)
          puts "#{album.metadata[:artist]} - #{album.metadata[:album_title]}"
        end
      end

    end

  end
  CLI = Cli.instance
end
