RSpec.describe Activerecord::QuietSchemaVersion::SchemaDumper do
  it "remove ActiveRecord::Schema.define arguments" do
    stream = StringIO.new
    ActiveRecord::SchemaDumper.dump(ActiveRecord::Base.connection, stream)
    expected = <<~SCHEMA
      # This file is auto-generated from the current state of the database. Instead
      # of editing this file, please use the migrations feature of Active Record to
      # incrementally modify your database, and then regenerate this schema definition.
      #
      # Note that this schema.rb definition is the authoritative source for your
      # database schema. If you need to create the application database on another
      # system, you should be using db:schema:load, not running all the migrations
      # from scratch. The latter is a flawed and unsustainable approach (the more migrations
      # you'll amass, the slower it'll run and the greater likelihood for issues).
      #
      # It's strongly recommended that you check this file into your version control system.

      ActiveRecord::Schema.define() do

      end
    SCHEMA
    # rails4 has magic comment
    if ActiveRecord.version < Gem::Version.new("5.0.0")
      expected = "# encoding: UTF-8\n" + expected
    end
    expect(stream.string).to eq expected
  end
end
