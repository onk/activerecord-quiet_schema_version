module Activerecord
  module QuietSchemaVersion
    module SchemaDumper
      def initialize(connection, options = {})
        @connection = connection
        @version = nil # <- monkeypatched this line
        @options = options
      end
    end
  end
end

ActiveRecord::SchemaDumper.prepend Activerecord::QuietSchemaVersion::SchemaDumper
