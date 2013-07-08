# capistrano-apache2

This gem provides two capistrano tasks:

* `apache2:setup` -- creates /etc/apache2/sites-available/YOUR\_APP and links it to /etc/apache2/sites-enabled/YOUR\_APP
* `apache2:reload` -- invokes `/etc/init.d/apache2 reload` on server

And apache2 configuration file generator, that will create local copy of default apache2 config for customization.

## Installation

Add this line to your application's Gemfile:

    gem 'capistrano-apache2'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install capistrano-apache2

## Usage

Add this to your `config/deploy.rb` file:

    require 'capistrano/apache2/tasks'

Make sure, following variables are defined in your `config/deploy.rb`:

* `application` - application name
* `server_name` - your application's server_name in apache2 (e.g. `example.com`)
* `deploy_to` - deployment path
* `sudo_user` - user name with sudo privileges (needed to config/restart apache2)
* `app_port` - application port (optional)

Launch new tasks:

    $ cap apache2:setup
    $ cap apache2:reload

Or you can add hook to call this tasks after `deploy:setup`. Add to your `config/deploy.rb`:

    after "deploy:setup", "apache2:setup", "apache2:reload"

If you want to customize apache2 configuration, just generate local apache2 config before running `apache2:setup`:

    $ rails generate capistrano:apache2:config

And then edit file `config/deploy/apache2_conf.erb` as you like.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
