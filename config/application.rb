require_relative 'boot'

require 'rails/all'
#require_relative 'version'
#require 'version'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module TestGuru
  #include Version
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
    config.time_zone = "Astana"

    config.i18n.default_locale = :ru
    config.i18n.fallbacks = {'ru' => 'en'}
#    config.autoload_paths << "#{Rails.root}/lib/clients"

  end
end
