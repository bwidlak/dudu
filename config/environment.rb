# Specifies gem version of Rails to use when vendor/rails is not present
RAILS_GEM_VERSION = '2.3.8' unless defined? RAILS_GEM_VERSION

# Bootstrap the Rails environment, frameworks, and default configuration
require File.join(File.dirname(__FILE__), 'boot')

Rails::Initializer.run do |config|
  # Add additional load paths for your own custom dirs
  # config.load_paths += %W( #{RAILS_ROOT}/extras )

  # Specify gems that this application depends on and have them installed with rake gems:install
  # config.gem "bj"
  # config.gem "hpricot", :version => '0.6', :source => "http://code.whytheluckystiff.net"
  # config.gem "sqlite3-ruby", :lib => "sqlite3"
  # config.gem "aws-s3", :lib => "aws/s3"
  # config.gem 'flickr-fu', :version => '0.1.4', :lib => 'flickr_fu'
  # config.gem 'commonthread-flickr_fu', :lib => 'flickr_fu', :version => '0.3.0', :source => 'http://gems.github.com'

  config.gem 'ambethia-smtp-tls', :version => ">=1.1.2", :lib => "smtp-tls", :source => "http://gems.github.com"
  config.gem 'mislav-will_paginate', :version => '>=2.3.8', :lib => 'will_paginate'
  config.gem 'settingslogic', :version => ">=2.0.6"
  config.gem 'shoulda'
  config.gem 'jnunemaker-validatable', :version => '>=1.8.4', :lib => "validatable"
  config.gem 'searchlogic', :version => '2.4.25'
  
  # Only load the plugins named here, in the order given (default is alphabetical).
  # :all can be used as a placeholder for all plugins not explicitly named
  # config.plugins = [ :exception_notification, :ssl_requirement, :all ]

  # Activate observers that should always be running
  # config.active_record.observers = :cacher, :garbage_collector, :forum_observer

  # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
  # Run "rake -D time" for a list of tasks for finding time zone names.
  config.time_zone = 'Warsaw'

  # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
  # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}')]
  config.i18n.default_locale = :pl
end

ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.smtp_settings = Settings.smtp
