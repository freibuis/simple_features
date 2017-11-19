module SimpleFeaturesHelper

  def features
    @features ||= SimpleFeatures::Features.load_config
  end

end
