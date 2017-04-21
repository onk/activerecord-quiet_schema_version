RSpec.describe Activerecord::QuietSchemaVersion do
  it "has a version number" do
    expect(Activerecord::QuietSchemaVersion::VERSION).not_to be nil
  end
end
