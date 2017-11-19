class SimpleFeaturesGenerator < Rails::Generators::Base

  source_root File.expand_path("../templates", __FILE__)
  class_option :features, type: :array, required: false, desc: "adding custom features"


  desc "Creates the base configuration files for simple feature"

  def create_features_config_file
    @features = options[:features]
    template "config/simple_features.yml", "config/simple_features.yml"
  end


  private

  def features
    if options['features']
      options['features']
    else
      [:feature_one, :feature_two, :feature_three]
    end
  end


end