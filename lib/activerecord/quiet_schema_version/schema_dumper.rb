require "activerecord/quiet_schema_version/schema_dumper/ar_4_2"
require "activerecord/quiet_schema_version/schema_dumper/ar_5_0"
require "activerecord/quiet_schema_version/schema_dumper/ar_5_2"

if ActiveRecord.version < Gem::Version.new("5.0.0.beta1")
  # ActiveRecord 4.2
  # https://github.com/rails/rails/commit/9e4ed2f996d8dd7eaac0399f4efb5ce58aa593f8
  ActiveRecord::SchemaDumper.prepend Activerecord::QuietSchemaVersion::SchemaDumper::AR42
elsif ActiveRecord.version < Gem::Version.create("5.2.0.alpha")
  # ActiveRecord 5.0, 5.1
  # https://github.com/rails/rails/commit/1d05e64b6dc5ba4ed1e21dd2975dcd7faf36795d
  ActiveRecord::SchemaDumper.prepend Activerecord::QuietSchemaVersion::SchemaDumper::AR50
else
  # >= ActiveRecord 5.2
  ActiveRecord::SchemaDumper.prepend Activerecord::QuietSchemaVersion::SchemaDumper::AR52
end
