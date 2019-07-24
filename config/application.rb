require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you"ve limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module MoneyLover
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2
    config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '**', '*.{rb,yml}')]
    config.i18n.available_locales = [:en, :vi]
    config.i18n.default_locale = :en
    config.generators do |g|
      g.orm             :active_record
      g.template_engine nil
      g.test_framework  nil
      g.stylesheets     false
      g.javascripts     false
    end
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
    config.i18n.load_path += Dir[Rails.root.join("config", "locales", "**",
        "*.{rb,yml}")]
    config.i18n.available_locales = [:en, :vi]
    config.i18n.default_locale = :en
    config.action_view.embed_authenticity_token_in_remote_forms = true
  end
end
