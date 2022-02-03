require_relative 'boot'

config.assets.initialize_on_precompile = false

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module ReviewApp
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2

    config.time_zone = 'Sydney'
    config.active_record.default_timezone = :local

  end
end
