module SimpleFeatures
  class Features
    attr_accessor :features

    def initialize(features = {})

      @features = features
      make_features
      self
    end

    #returns Feature object
    def self.load_config(config_file = nil)
      if defined? 'Rails'
        features = YAML.load_file(Rails.root.join('config', 'features.yml'))[environment]
      else
        features = YAML.load_file(config_file)
      end
      self.new(features)
    end


    private

    def make_features
      @features.each do |feature, feature_value|
        define_singleton_method("#{feature}?") do
          feature_value
        end
      end
    end

    def environment
      if defined? 'Rails'
        Rails.env
      else
        :production
      end
    end
  end
end