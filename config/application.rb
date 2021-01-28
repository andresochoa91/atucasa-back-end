require_relative 'boot'

require "rails"
# Pick the frameworks you want:
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "active_storage/engine"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_mailbox/engine"
require "action_text/engine"
require "action_view/railtie"
require "action_cable/engine"
# require "sprockets/railtie"
require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Atupuerta
  class Application < Rails::Application
    config.load_defaults 6.0
    config.autoload_paths += %W( lib/ )
    config.api_only = true
    # config.middleware.use ActionDispatch::Cookies

    config.action_controller.forgery_protection_origin_check = false

    config.middleware.insert_before 0, Rack::Cors, debug: true do
      allow do
        origins 'https://atucasa.netlify.app/', 'localhost:3001', 'localhost:3000'
        resource '*', 
          headers: :any,
          methods: [:get, :post, :put, :patch, :delete, :options, :head],
          credentials: true
      end
    end

    # config.action_dispatch.default_headers = {
    #   'Access-Control-Allow-Origin' => 'https://localhost:3001',
    #   'Access-Control-Request-Method' => %w{GET POST OPTIONS}.join(",")
    # }

  end
end
