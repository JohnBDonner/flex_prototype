# frozen_string_literal: true

class DecisionTreeService
  ACTIVE_DECISIONS = [
    SubscriptionScreenAbtestDecision
  ].freeze

  def initialize(params)
    @params = params
    @decisions = ACTIVE_DECISIONS
  end

  def decide
    @decisions.map { |decision_klass| decision_klass.new(@params).decide }
  end
end
