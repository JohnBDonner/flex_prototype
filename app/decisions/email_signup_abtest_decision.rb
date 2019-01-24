# frozen_string_literal: true

class EmailSignupAbtestDecision < BaseDecision
  def decide
    replace_component if user_is_in_email_signup_abtest?
  end

  private

  def slot
    "signup_flow"
  end

  def component_type
    "signup_email_priority_201812"
  end

  def user_is_in_email_signup_abtest?
    @user &&
      ABTEST_EMAIL_SIGNUP_ROLE_NAME.in?(@user.role_names) ||
      anonymous_user_in_email_signup_abtest?
  end

  def anonymous_user_in_email_signup_abtest?
    return false unless @fingerprint

    test_sessions = fetch_anonymous_test_sessions @fingerprint, ABTEST_EMAIL_SIGNUP_TEST_NAMES
    test_sessions&.map(&:group)&.include?(ABTEST_EMAIL_SIGNUP_GROUP_NAME)
  end
end
