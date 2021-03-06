require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Web007erSo
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1
    config.time_zone = "Beijing"

    config.generators do |generator|
      generator.test_framework :rspec
      generator.helper = false
      generator.assets false
    end
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
  end
end

Time::DATE_FORMATS.merge!(:default => '%m/%d %I:%M %p', :ymd => '%Y/%m/%d')
