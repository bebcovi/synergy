require "synergy/engine"
require "active_support/core_ext/module/attribute_accessors"

module Synergy
  def self.app
    Rails.application.class
  end
end
