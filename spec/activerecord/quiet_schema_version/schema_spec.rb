RSpec.describe Activerecord::QuietSchemaVersion::Schema do
  it ".define without argument calls #define with maximum version" do
    expect_any_instance_of(ActiveRecord::Schema).to receive(:define).with(version: 2)
    ActiveRecord::Schema.define() { }
  end

  it ".detect_maximum_version detects the maximum version" do
    expect(ActiveRecord::Schema.detect_maximum_version).to eq 2
  end
end
