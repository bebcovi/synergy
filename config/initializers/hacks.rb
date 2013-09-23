# Somehow this code gets called twice, producing an "already initialized
# constant 'AttrNames'" warning. So this is a monkey patch which doesn't
# define 'AttrNames' if it has already been defined.
module ActiveRecord
  module Core
    module ClassMethods
      def initialize_generated_modules
        @attribute_methods_mutex = Mutex.new

        unless generated_attribute_methods.constants.include?(:AttrNames)
          # force attribute methods to be higher in inheritance hierarchy than other generated methods
          generated_attribute_methods.const_set(:AttrNames, Module.new {
            def self.const_missing(name)
              const_set(name, [name.to_s.sub(/ATTR_/, '')].pack('h*').freeze)
            end
          })

          generated_feature_methods
        end
      end
    end
  end
end

# This fixes 'spring' not working for some reason
module ActiveAdmin
  class Application
    def files_with_connection
      ActiveRecord::Base.establish_connection
      files_without_connection
    end
    alias_method_chain :files, :connection
  end
end
