class Configuration < Struct.new(:slot, :conditions, :components)
  DEFUALT_CONFIGURATIONS = [
    [
      "subscription_purchase",
      "ios",
      "subscription_yearly_price_presentation_201807"
    ],
    [
      "subscription_purchase",
      "android",
      "subscription_green_screen_201811"
    ],
    [
      "signup_flow",
      "ios",
      "signup_social_priority_201812"
    ],
    [
      "signup_flow",
      "android",
      "signup_social_priority_201812"
    ]
  ].freeze

  def fetch_default_configurations!
    DEFUALT_CONFIGURATIONS.map do |slot, platform, component_type|
      configuration = find_by(slot: slot, platform: platform)
      configuration.components << Component.find_by(component_type: component_type)
    end
  end
end

class Component < Struct.new(:component_type, :variation, :conditions, :attributes)
end

class Condition < Struct.new(:subject, :operator, :value)
end

class ComponentAttribute < Struct.new(:json)
end
