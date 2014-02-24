module LastDup
  module Helper
    def gather_music_folders(root_folder)
      music_folders = []
      Dir.glob("#{root_folder}/**/*") do |file|
        if (File.directory? file) && Dir.glob("#{file}/*.mp3").size != 0
          music_folders << file  
        end
      end
      return music_folders
    end
  end
end
