# frozen_string_literal: true

class BaseDecision
  def self.decide
    new.decide
  end

  def initialize(params)
    @user_id = params[:user_id]
    @fingerprint = params[:fingerprint]
    @client_details = params[:client_details]
  end

  def decide
    raise "please implement a #decide method for the decision"
  end

  private

  def component_type
    raise "please implement a #component_type method for the decision"
  end

  def slot
    raise "please implement a #slot method for the decision"
  end

  def replace_component(_slot = slot, _component_type = component_type)
    [:replace, _slot, _component_type]
  end

  def add_component(_slot = slot, _component_type = component_type)
    [:add, _slot, _component_type]
  end
end
