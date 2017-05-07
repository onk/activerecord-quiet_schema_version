module Activerecord
  module QuietSchemaVersion
    module SchemaDumper
      module AR42
        def initialize(connection, options = {})
          @connection = connection
          @types = @connection.native_database_types
          @version = nil # <- monkeypatched this line
          @options = options
        end
      end
    end
  end
end
