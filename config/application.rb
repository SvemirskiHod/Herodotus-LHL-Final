 require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Herodotus
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    # config.web_console.whitelisted_ips = '10.0.2.2'
    config.middleware.insert_before 0, Rack::Cors do
      allow do
        origins 'https://herodotus-final.herokuapp.com'
        resource '*', :headers => :any, :methods => [:get, :post, :delete, :put, :options]
      end
    end

    # config.middleware.insert_before 0, Rack::Cors do
    #   allow do
    #     origins 'localhost:3002'
    #     resource '*', :headers => :any, :methods => [:get, :post, :delete, :put, :options]
    #   end
    # end

    config.to_prepare do
      DeviseController.respond_to :html, :json
    end

  end
end

# make port number same as in axios
