require File.expand_path('../boot', __FILE__)

require 'rails/all'

Bundler.require(*Rails.groups)

# Require platform-specific gems
platform = RUBY_PLATFORM.match(/(linux|darwin)/)[0].to_sym
Bundler.require(platform)

module Rubyvoodoo
  class Application < Rails::Application
    require_all "#{Rails.root}/lib/extensions"
    require_all "#{Rails.root}/lib/logging" if !Rails.env.production?
    
    require_all "#{Rails.root}/lib/virtus"
    require_all "#{Rails.root}/lib/devise"
    require_all "#{Rails.root}/lib/simple_form"
    require     "#{Rails.root}/config/smtp"

    config.generators do |generate|
      generate.scaffold_controller :responders_controller
      generate.helper false
      generate.template_engine :erb
      generate.javascript_engine false
      generate.stylesheets false

      generate.test_framework :rspec
      generate.request_specs false
      generate.routing_specs false
      generate.view_specs false
    end

    config.i18n.enforce_available_locales = true

    config.active_job.queue_adapter = :sidekiq

    config.action_controller.action_on_unpermitted_parameters = :raise

    # Do not swallow errors in after_commit/after_rollback callbacks.
    config.active_record.raise_in_transactional_callbacks = true
  end
end
