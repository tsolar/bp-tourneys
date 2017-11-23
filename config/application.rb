require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

Dotenv::Railtie.load

HOSTNAME = ENV["HOSTNAME"] || "bp-tourneys"

module BPTourneys
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    config.active_job.queue_adapter = :delayed_job
    config.active_job.queue_name_prefix = "bp_tourneys-#{Rails.env}"
    config.active_job.queue_name_delimiter = "."

    # Mailer config
    config.action_mailer.delivery_method = :smtp
    config.action_mailer.smtp_settings = {
      user_name: ENV["ACTION_MAILER_SMTP_USERNAME"],
      password: ENV["ACTION_MAILER_SMTP_PASSWORD"],
      domain: ENV["ACTION_MAILER_SMTP_DOMAIN"],
      address: ENV["ACTION_MAILER_SMTP_ADDRESS"],
      port: ENV["ACTION_MAILER_SMTP_PORT"],
      authentication: ENV["ACTION_MAILER_SMTP_AUTHENTICATION"] || :plain,
      enable_starttls_auto: true
    }

    config.action_mailer.default_url_options = {
      host: ENV["ACTION_MAILER_DEFAULT_URL_HOST"] || "localhost",
      port: ENV["ACTION_MAILER_DEFAULT_URL_PORT"] || 3000,
      protocol: ENV["ACTION_MAILER_DEFAULT_URL_PROTOCOL"] || "https"
    }
  end
end
