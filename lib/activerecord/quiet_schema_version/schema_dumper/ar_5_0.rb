module Activerecord
  module QuietSchemaVersion
    module SchemaDumper
      module AR50
        def initialize(connection, options = {})
          @connection = connection
          @version = nil # <- monkeypatched this line
          @options = options
        end
      end
    end
  end
end
