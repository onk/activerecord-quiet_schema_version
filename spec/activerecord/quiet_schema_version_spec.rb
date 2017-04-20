require "spec_helper"

RSpec.describe Activerecord::QuietSchemaVersion do
  it "has a version number" do
    expect(Activerecord::QuietSchemaVersion::VERSION).not_to be nil
  end

  it "does something useful" do
    expect(false).to eq(true)
  end
end
