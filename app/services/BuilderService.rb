# frozen_string_literal: true

class BuilderService
  def initialize(tree_results)
    @config = Configuration.fetch_default_configurations!
    @tree_results = tree_results
  end

  def build
    @tree_results.each do |action, slot, component_type|
      send("#{action}_component", slot, component_type)
    end

    @config
  end

  private

  def replace_compenents(slot, component_type)
    @config.slot(slot).components = [Component.find_by(component_type: component_type)]
  end

  def add_components(slot, component_type)
    @config.slot(slot).components << Component.find_by(component_type: component_type)
  end
end
