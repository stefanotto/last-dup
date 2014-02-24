# LastDup

## Installation

    $ gem install last-dup

## Usage

    last-dup [...--param=val...] dir

    Params:
           --api_key=String         Your Lastfm API key [Required]
           --api_secret=String      Your Lastfm API key secret [Required]
       -u, --username=String        The Lastfm account to check against [Required]

You can get your Last.fm API key from http://www.last.fm/api/account/create.

On first run, a blank config file will be created in your home directory for you to provide those.

Commandline arguments will always have precedence.

The given directory will be scanned recursively by default.

## Contributing

1. Fork it ( http://github.com/<my-github-username>/smart_dup/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
