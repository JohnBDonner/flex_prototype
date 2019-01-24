# frozen_string_literal: true

class SubscriptionScreenAbtestDecision < BaseDecision
  def decide
    replace_component if user_is_in_subscription_screen_abtest?
  end

  private

  def slot
    "subscription_purchase"
  end

  def component_type
    "subscription_yearly_price_presentation_201807"
  end

  def user_is_in_subscription_screen_abtest?
    @user.present? && ABTEST_SUBSCRIPTION_ROLE_NAME.in?(@user.role_names)
  end
end
