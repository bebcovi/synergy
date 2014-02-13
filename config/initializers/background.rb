require "carrierwave_backgrounder"
require "sucker_punch"

CarrierWave::Backgrounder.configure do |config|
  config.backend :sucker_punch, queue: :carrierwave
end

SuckerPunch.config do
  queue name: :carrierwave, worker: CarrierWave::Workers::StoreAsset, workers: 2
  self.logger = nil
end

##
# https://github.com/lardawge/carrierwave_backgrounder/pull/169
#
module CarrierWave::Backgrounder::ORM::Base
  def store_in_background(column, worker = ::CarrierWave::Workers::StoreAsset)
    attr_accessor :"process_#{column}_upload"

    mod = Module.new
    include mod
    mod.class_eval  <<-RUBY, __FILE__, __LINE__ + 1
      def remove_#{column}=(value)
        super
        self.process_#{column}_upload = true
      end

      def write_#{column}_identifier
        super and return if process_#{column}_upload
        self.#{column}_tmp = _mounter(:#{column}).cache_name if _mounter(:#{column}).cache_name
      end

      def store_#{column}!
        super if process_#{column}_upload
      end

    RUBY

    _define_shared_backgrounder_methods(mod, column, worker)
  end
end
