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

        unless is_boolean? feature_value
          begin
            raise ArgumentError.new("Value must be true or false for key #{feature}")
          rescue ArgumentError => e
            puts e.message
          end
        else
          define_singleton_method("#{feature}?") do
            feature_value
          end
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

    def is_boolean?(value)
      value = "#{value}".downcase
      ['true', 'false'].include? value
    end
  end
end