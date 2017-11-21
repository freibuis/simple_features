require "simple_features"
RSpec.describe SimpleFeatures::Features do
  describe "features" do

    features_config = { feature_one: true, feature_two: false, feature_three: 'abc' }
    simple_features = SimpleFeatures::Features.new(features_config)

    let(:features) { simple_features }
    let(:config_file) { features_config }

    it "feature_one? returns feature true" do
      expect(features.feature_one?).to eq(true)
    end

    it "feature_two? returns feature false" do
      expect(features.feature_two?).to eq(false)
    end

    it "feature_three? should return undefined method" do
      expect{features.feature_three?}.to raise_error(NameError)
    end

  end
end