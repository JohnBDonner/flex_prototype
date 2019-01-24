# frozen_string_literal: true

class ConfigurationsController < ApplicationController
  def index
    tree_results = DecisionTreeService.new(filter_params).decide
    @config = BuilderService.new(tree_results).build
  end

  private

  def filter_params
    params.require(:filter).permit(:user_id, :fingerprint, :client_details)
  end
end
