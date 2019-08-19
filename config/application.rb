require_relative "boot"

require "rails/all"

Bundler.require(*Rails.groups)

module MoneyLover
  class Application < Rails::Application
    config.load_defaults 5.2
    config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '**', '*.{rb,yml}')]
    config.i18n.available_locales = [:en, :vi]
    config.i18n.default_locale = :vi
    config.generators do |g|
      g.orm             :active_record
      g.template_engine nil
      g.test_framework  nil
      g.stylesheets     false
      g.javascripts     false
    end
    config.load_defaults 5.2

    config.i18n.load_path += Dir[Rails.root.join("config", "locales", "**",
        "*.{rb,yml}")]
    config.i18n.available_locales = [:en, :vi]
    config.i18n.default_locale = :vi
    config.action_view.embed_authenticity_token_in_remote_forms = true

    config.generators do |g|
      g.test_framework :rspec,
        fixtures: true,
        view_specs: false,
        helper_specs: false,
        routing_specs: false,
        controller_specs: true,
        request_specs: true
      g.fixture_replacement :factory_girl, dir: "spec/factories"
    end
  end
end
