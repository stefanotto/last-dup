require 'configliere'

Settings.use :commandline

Settings.define :api_key, required: true, description: "Your Lastfm API key"
Settings.define :api_secret, required: true, description: "Your Lastfm API key secret"
Settings.define :username, required: true, flag: "u", description: "The Lastfm account to check against"

CONFIG_FILE_LOCATION = File.join(Dir.home, '.last-dup/')
CONFIG_FILE = File.join(CONFIG_FILE_LOCATION, 'lastfm.yaml')

unless File.exists?(CONFIG_FILE)
  File.open(CONFIG_FILE, 'w') do |file|
      file.puts ':api_key: '
      file.puts ':api_secret: '
      file.puts ':username: '
    end
  end

Settings.read CONFIG_FILE

begin
  Settings.resolve!
rescue => message
  puts message
end