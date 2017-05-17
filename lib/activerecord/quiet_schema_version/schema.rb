module Activerecord
  module QuietSchemaVersion
    module Schema
      def self.prepended(base)
        class << base
          self.prepend(ClassMethods)
        end
      end

      module ClassMethods
        def define(info = {}, &block)
          info[:version] ||= detect_maximum_version # <- monkeypatched this line
          new.define(info, &block)
        end

        def detect_maximum_version
          migrations_paths = ActiveRecord::Migrator.migrations_paths
          paths = migrations_paths.map { |p| "#{p}/**/[0-9]*_*.rb" }
          versions = Dir[*paths].map do |filename|
            filename.split("/").last.split("_").first.to_i
          end
          versions.max
        end
      end
    end
  end
end

ActiveRecord::Schema.prepend Activerecord::QuietSchemaVersion::Schema
