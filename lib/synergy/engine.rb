require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "sprockets/railtie"

# Views
require "haml-rails"
require "simple_form"
require "will_paginate/railtie"
require "will_paginate/array"
require "draper"
require "letter_opener"

# Assets
require "sass-rails"
require "bourbon"
require "sassy-buttons-bourbon"
require "jquery-rails"
require "coffee-rails"
require "uglifier"
require "quiet_assets" if Rails.env.development?

# Database
require "carrierwave"

# Other
require "pry-rails" if Rails.env.development?
require "better_errors" if Rails.env.development?

module Synergy
  class Engine < Rails::Engine
    config.generators do |g|
      g.test_framework nil
      g.fixture_replacement nil
      g.assets false
      g.helper false
    end
  end
end
